/// @description Player Movement

// Check keys for movement
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveUp = keyboard_check(vk_up);
moveDown = keyboard_check(vk_down);


// Calculate movement

vx = (moveRight*walkSpeed) - (moveLeft*walkSpeed);
vy = (moveDown*walkSpeed) - (moveUp*walkSpeed);

//if idle
if (vx==0&&vy==0)
{
	switch dir
	{
		case 0: sprite_index = spr_player_idle_right;break;
		case 1: sprite_index = spr_player_idle_up;break;
		case 2: sprite_index = spr_player_idle_left;break;
		case 3: sprite_index = spr_player_idle_down;break;
	}
}

if (vx!=0 || vy!=0)
{
	x += vx;
	y += vy;
	
	// change walking sprites based on direction change
	if(vx > 0)
	{
		sprite_index = spr_player_walk_right;
		dir = 0;
	}
	if(vx<0)
	{
		sprite_index = spr_player_walk_left;
		dir = 2;
	}
	if(vy>0)
	{
		sprite_index = spr_player_walk_down;
		dir = 3;
	}
	if(vy<0)
	{
		sprite_index = spr_player_walk_up;
		dir = 1;
	}
	
}

// Depth Sorting
depth = -y;
