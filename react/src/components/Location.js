import React from 'react';

const Location = props => {
  let location = props.name;
  let id = props.id
  let url = "/locations/" + props.id
  return (
    <li>
       <a href={url}>{location}</a>
    </li>
  );
};

export default Location;
