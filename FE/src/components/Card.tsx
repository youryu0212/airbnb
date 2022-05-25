interface Props {
  content: string;
  msg: string;
}

function Card({ content, msg }: Props) {
  return (
    <h1>
      {content} {msg}
    </h1>
  );
}

export default Card;
