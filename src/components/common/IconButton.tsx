import React, { FunctionComponent } from 'react';
import { ReactComponent as Menu } from '@assets/images/icon_menu.svg';
import { Button } from './IconButton.style';

type IconProps = {
  icon: string;
};

const icons: { [key: string]: FunctionComponent } = {
  menu: Menu
};

export default function IconButton({ icon }: IconProps) {
  const Icon = icons[icon];

  return (
    <Button>
      <Icon />
    </Button>
  );
}
