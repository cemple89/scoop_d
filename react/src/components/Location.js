import React from 'react';

const Location = props => {
  let location = props.name;
  let neighborhood = props.neighborhood;
  let image = props.image;
  let id = props.id
  let url = "/locations/" + props.id


  return (
    <a href={url}><div className="location-box">
      <div className="location-image">
        <img src={image} />
      </div>
      <div className="location-info">
        <h3>{location}</h3>
        <h4>{neighborhood}</h4>
      </div>
    </div>
    </a>
  );
};

export default Location;
