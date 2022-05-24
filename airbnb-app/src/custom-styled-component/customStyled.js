import React, { useRef, useEffect } from 'react';
import domElements from './utils/domElements';

const customStyled =
  TargetComponent =>
  (strs, ...exprs) =>
  props => {
    const elementRef = useRef(null);

    useEffect(() => {
      console.log('strs :', strs, 'exprs:', exprs);
      const style = exprs.reduce((result, expr, index) => {
        const isFunc = typeof expr === 'function';
        const value = isFunc ? expr(props) : expr;

        return result + value + strs[index + 1];
      }, strs[0]);

      elementRef.current.setAttribute('style', style);
    });

    return <TargetComponent {...props} ref={elementRef} />;
  };

domElements.forEach(domElement => (customStyled[domElement] = customStyled(domElement)));
