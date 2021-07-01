# Dicecord Flutter

An application designed to act as a dice roller which integrates with Discord.

## Getting Started

To get started please use the following steps:

### Setting up the Dicecord Bot

<ol>
    <li>Click on <a href="https://discord.com/api/oauth2/authorize?client_id=858774576702685215&permissions=536881152&scope=bot">this link</a> to access the invitation prompt</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859179197016965130/unknown.png"/>
    <li>Under the <i>Add to Server</i> dropdown, select the server you wish to add Dicecord to.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859178881511850024/unknown.png"/>
    <li>Click the <i>Continue</i> button.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859179617256865842/unknown.png"/>
    <li>Click the <i>Authorize</i> button.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859179970912190514/unknown.png?width=406&height=676"/>
    <li>Verify that you're human by clicking the <i>I am human</i> checkbox.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859180395466457098/unknown.png"/>
    <li>Depending on your server's settings, you may receive a message like this to notify the server that Dicecord has joined.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859180639215681546/unknown.png"/>
    <li>Select the channel you wish to use Dicecord in and send a message to it saying ```/dc create```</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859181165167509534/unknown.png"/>
    <li>Dicecord will substitute this message with your <i>Dicecord Code</i> for this channel.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859181697287061515/unknown.png"/>
</ol>

Once you have your Dicecord Code, you're ready to continue on to the next step!

### Adding a game to the Dicecord App

You can install the Dicecord App using the following links:

<ul>
    <li><a href="https://github.com/corndog-foundry/dicecord-flutter/releases/download/v1.1.0/dicecord-flutter-1.1.0.apk">Android</a></li>
    <li><a href="https://github.com/corndog-foundry/dicecord-flutter/releases/download/v1.1.0/dicecord-flutter-1.1.0.rar">Windows</a></li>
</ul>

Mac, Linux, and iOS support are currently being worked on.

Upon starting up the app, you should see a screen like this:

<img src="https://media.discordapp.net/attachments/824993271423828038/859183071026348082/Screenshot_1624915598.png?width=320&height=676"/>

To add a game to the app, use the following steps:

<ol>
    <li>Click the <i>+</i> button in the bottom-right corner.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859183422404952074/Screenshot_1624915686.png?width=320&height=676"/>
    <li>Fill in the game's name.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859183717003952168/Screenshot_1624915755.png?width=320&height=676"/>
    <li>Enter the Dicecord Code you obtained in the previous section.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859184047141027860/unknown.png?width=320&height=676"/>
    <li>Enter a nickname; your nickname will be shown any time you make a roll.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859184336657711134/unknown.png?width=320&height=676"/>
    <li>Select the type of dice your game uses from the dropdown.</li>
    <img src="https://media.discordapp.net/attachments/824993271423828038/859184626412552240/unknown.png?width=320&height=676"/>
    <li>Click the <i>Create Game</i> button.</li>
</ol>

Once the game has been added, you should be able to see it on the main screen like so:
<img src="https://media.discordapp.net/attachments/824993271423828038/859184809918201916/Screenshot_1624916016.png?width=320&height=676"/>

Touching the game opens up the dice screen depending on which of the dice types you selected:

#### Standard Dice
<img src="https://media.discordapp.net/attachments/824993271423828038/859185027572957192/Screenshot_1624916068.png?width=320&height=676"/>

#### Star Wars FFG / Genesys
<img src="https://media.discordapp.net/attachments/824993271423828038/859185320117796874/Screenshot_1624916139.png?width=320&height=676"/>

#### Vampire the Masquerade 5e
<img src="https://media.discordapp.net/attachments/824993271423828038/859185579110301726/Screenshot_1624916198.png?width=320&height=676"/>

## Using Dicecord

#### Adding dice
You can touch the dice symbols to add dice to your roll.
<ul>
<img src="https://media.discordapp.net/attachments/824993271423828038/859186197557018624/unknown.png?width=320&height=676"/>
<img src="https://media.discordapp.net/attachments/824993271423828038/859186463707103232/unknown.png?width=320&height=676"/>
</ul>


#### Adding multiple dice
You can touch and hold the dice symbols to set the number of dice to use.
<ul>
<img src="https://media.discordapp.net/attachments/824993271423828038/859186197557018624/unknown.png?width=320&height=676"/>
<img src="https://media.discordapp.net/attachments/824993271423828038/859187140919033877/Screenshot_1624916565.png?width=320&height=676"/>
<img src="https://media.discordapp.net/attachments/824993271423828038/859187384196661288/unknown.png?width=320&height=676"/>
</ul>

#### Rolling
Once you've entered the dice you want to roll, simply touch the box containing the roll formula.
<ul>
<img src="https://media.discordapp.net/attachments/824993271423828038/859187776598835240/unknown.png?width=320&height=676">
</ul>
If you're using an Android device, you should see a toast notification telling you the result of the roll. Regardless of device, Dicecord will post a message in the channel for the game with the results of the roll.
<ul>
<img src="https://media.discordapp.net/attachments/824993271423828038/859188153700188160/unknown.png"/>
</ul>

#### Clearing a Roll
To clear a roll, simply touch and hold the box containing the roll formula.