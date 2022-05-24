import React from 'react';

interface props {
  content: string;
  msg: string;
}

function Card({ content, msg }: props) {
  return (
    <h1>
      {content} {msg}
      <span>asdf</span>
    </h1>
  );
}

export default Card;
