import React from 'react';
import Location from './Location';

const LocationList = props => {
  let locations = props.locations.map(location => {
    
    return (
      <Location
        key={location.id}
        id={location.id}
        name={location.name}
        neighborhood={location.neighborhood}
        image={location.image_url}
      />
    );
  });

  return (
    <div>
      <ul>
        {locations}
      </ul>
    </div>
  );
};

export default LocationList;
