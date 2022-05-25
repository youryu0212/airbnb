import React from 'react';
import StyledMenu from 'components/GNB/Menu/Menu.styled';
import { ReactComponent as AccomodationIcon } from 'img/svg/accomodation.svg';
import { ReactComponent as ExperienceIcon } from 'img/svg/experience.svg';
import { ReactComponent as OnlineExperienceIcon } from 'img/svg/online-experience.svg';

function Menu() {
  return (
    <StyledMenu className="menu">
      <li>
        <AccomodationIcon />
      </li>
      <li>
        <ExperienceIcon />
      </li>
      <li>
        <OnlineExperienceIcon />
      </li>
    </StyledMenu>
  );
}

export default Menu;
