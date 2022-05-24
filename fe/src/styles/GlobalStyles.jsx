import { createGlobalStyle } from 'styled-components';
import reset from 'styled-reset';

export const GlobalStyles = createGlobalStyle`
	${reset};
	* { 
		margin: 0; 
		padding: 0; 
		box-sizing: border-box; 
	} 
	body { 
		font-family: 'Noto Sans KR', sans-serif; 
	} 
	a {
		text-decoration: none; 
		color: transparent;
	}
	button { 
		border: none;
		outline: none; 
		background: transparent; 
		cursor: pointer; 
	}

`;
