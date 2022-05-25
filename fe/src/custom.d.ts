declare module '*.png' {
  import React = require('react');

  export const ReactComponent: React.FC<React.SVGProps<SVGSSVGElement>>;
  const src: string;
  export default src;
}

declare module '*.svg' {
  import React = require('react');

  export const ReactComponent: React.FC<React.SVGProps<SVGSSVGElement>>;
  const src: string;
  export default src;
}
