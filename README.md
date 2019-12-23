# BCMemes

In this app we brought together what never was meant to be togehter. But we don't care. With this extension you can create and save memes in Business Central.

## Features
- Get the most used meme templates from Imgflip ("Available Memes")
- Caption a template with top and bottom text ("Create Meme")
- Every meme you create will be stored in your gallery ("My Memes")
- Use your own Imgflip account to create memes

## How to use it
- Search for *My Memes* and open it
- Click on *Create new Meme* to open the list of available memes
`On every list you have a FactBox that shows the current selected meme completely`
- Click on *Caption this Meme* 
- Enter the Fields (Name, Top Text and Bottom Text) and then click *Make Meme*
`After this your meme will be created and saved available in the My Memes list`

### Use your own Imgflip Account
If you don't change anything the memes are created using an dummy account, created with anonbox (https://anonbox.net/de/). But maybe this account gets deleted or blocked or whatever. If this is the case you can insert your own account in *Meme Setup*
- First you need an account on Imgflip (Signup [here](https://imgflip.com/signup "here"))
- Now insert your username and password in *Meme Setup*

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

To install this extension you the following:
- Running Business Central instance, for example Cloud Sandbox or Docker-Container.
	- Url for Cloud Sandbox https://businesscentral.dynamics.com/sandbox
	- If you like to use Docker freddys blog is a good start: https://freddysblog.com/ 
- Visual Studio Code (Get it [here](https://code.visualstudio.com/ "here"))
	- Install AL Language extension (Get it [here](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al "here"))
- Git, if you want clone this repo or make a pull request (Get it [here](https://git-scm.com/downloads "here"))

### Installing

#### Clone the Repository
- Go to https://github.com/NotBCSupport/BCMemes and click on "clone or donwload"
- Copy the URL. For example https://github.com/NotBCSupport/BCMemes.git
- Open Visual Studio Code
- Press *CTRL + SHIFT + P*  to open the command palette
- In the command palette type *git clone*
- Insert the URL you copied before
- select a folder where you want to save the project for example *C:\Users\USERNAME\Documents\AL\*

#### Download Symbols
- Press *CTRL + SHIFT + P*  to open the command palette
- In the command palette type *AL Download Symbols*
- You will be asked if you want to connect to a Cloud Sandbox or to your own server.
If you have a cloud sandbox click it and you are done. if you have a docker or other installaltion you need to enter your connection data to launch.json
- Now repeat... again open the command palette and type  *AL Download Symbols* because when you first try it it will propably not download any symbols. Mybe you can create an idea at Microsoft the get that solved.
- if you still don't get any symbols and even don't get an error message open the command palette and type "AL Clear credentials cache" and then try again.

#### Build the application (Package)

- Press *CTRL + SHIFT + P*  to open the command palette
- In the command palette type *AL Package*

Or

- Press *CTRL + SHIFT + B*  to build the package

#### Publish the application to your dev environment
- Press F5 to publish the extension with debugger startet

Or

- Press CTRL + F5 to publish the extension without the debugger


## Running the tests

Fell free to create tests and then tell us how to run them or create am idea and wait until someone else is going to do it.

### Break down into end to end tests

Explain what these tests test and why. And when you're on it can you tell us how to test API's?

```
Give an example (We really want an example!)
```

## Deployment

To Install this on a live system go to *Extension Management* and select *Upload Extension*

## Built With

* [imgflip](https://api.imgflip.com/) - The API to get and create memes

## Versioning

We will do what we want. 

## Authors

* **Unofficial Business Central Support** - *Initial work* 

## License

This project is licensed under the GNU General Public License v3.0 License - see the [LICENSE](LICENSE) file for details
You can do what ever you want with it but we don't take any warranty. We are explicitly not responsible for people beeing upset because you sent them shitty memes!
