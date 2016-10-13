import React, { Component } from 'react';
import LocationList from './LocationList'

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      locations: []
    };
    this.getLocations = this.getLocations.bind(this);
  }

  getLocations() {
    let app = this;
    $.ajax({
      method: 'GET',
      url: '/locations.json',
      contentType: 'application/json'
    })
    .done(data => {
      app.setState({ locations: data })
    });
  }

  componentDidMount() {
    this.getLocations();
    setInterval(this.getLocations, 5000);
  }

  render() {
    let locations = this.state.locations;
    return (
      <div>
        <h1 className="locations-title">All Ice Cream Shops In Boston / Cambridge Area </h1>
          <LocationList
            locations={locations}
          />
      </div>
    );
  }
}

export default App;
