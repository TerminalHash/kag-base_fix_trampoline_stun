#include "ChatCommand.as"

class BombsCommand : ChatCommand
{
	BombsCommand()
	{
		super("bombs", "Spawn bombs");
	}

	void Execute(string name, string[] args, CPlayer@ player)
	{
		if (!isServer()) return;

		CBlob@ blob = player.getBlob();
		if (blob !is null)
		{
			Vec2f pos = blob.getPosition();
			for (uint i = 0; i < 3; i++)
			{
				server_CreateBlob("mat_bombs", -1, pos);
			}
		}
		else
		{
			server_AddToChat("Blobs cannot be spawned while dead or spectating", ConsoleColour::ERROR, player);
		}
	}
}
