import { Button, Grid } from "@mui/material";

const UserMenu = () => {
  return (
    <Grid
      container
      item
      xs={2}
      justifyContent="center"
      direction="column"
      alignItems="flex-end"
    >
      <Button color="black" disableFocusRipple disableRipple>
        메뉴
      </Button>
    </Grid>
  );
};

export default UserMenu;
