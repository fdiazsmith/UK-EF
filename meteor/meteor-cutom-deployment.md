# How to deploy meteor app to our custom server
### couple usefull links
* [meteor docs](http://docs.meteor.com/#deploying)
* [Stack overflow answer](https://stackoverflow.com/questions/17606340/how-to-deploy-a-meteor-application-to-my-own-server/17620793#17620793)

## copy paste form stackoverflow
______________

Meteor documentation currently says:

"[...] you need to provide Node.js 0.8 and a MongoDB server. You can then run the application by invoking node, specifying the HTTP port for the application to listen on, and the MongoDB endpoint."

So, among the several ways to install Node.js, I got it up and running following the best advice I found, which is basically unpacking the latest version available directly in the official Node.JS website, already compiled for Linux (64 bits, in my case):

# Does NOT need to be root user:

# create directory
mkdir -p ~/.nodes && cd ~/.nodes

# download latest Node.js distribution
curl -O http://nodejs.org/dist/v0.10.13/node-v0.10.13-linux-x64.tar.gz

# unpack it
tar -xzf node-v0.10.13-linux-x64.tar.gz

# discard it
rm node-v0.10.13-linux-x64.tar.gz

# rename unpacked folder
mv node-v0.10.13-linux-x64 0.10.13

# create symlink
ln -s 0.10.13 current

# add path to PATH
export PATH="~/.nodes/current/bin:$PATH"

# check
node --version
npm --version

And to install MongoDB, I simply followed the instructions in the MongoDB manual available in the Documentation section of its official website:

# Needs to be root user (apply "sudo" if not at root shell)

apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
apt-get update
apt-get install mongodb-10gen


The server is ready to run Meteor applications! For deployment, the main "issue" is where the "bundle" operation happens. We need to run meteor bundle command from inside the application source files tree. For example:

cd ~/leaderboard
meteor bundle leaderboard.tar.gz

If the deployment will happen in another server (flavour 2), we need to upload the bundle tar.gz file to it, using sftp, ftp, or any other file transfer method. Once the file is there, we follow both Meteor documentation and the README file which is magically included in the root of the bundle tree:

# unpack the bundle
tar -xvzf leaderboard.tar.gz

# discard tar.gz file
rm leaderboard.tar.gz

# rebuild native packages
pushd bundle/programs/server/node_modules
rm -r fibers
npm install fibers@1.0.1
popd

# setup environment variables
export MONGO_URL='mongodb://localhost'
export ROOT_URL='http://example.com'
export PORT=3000

# start the server
node main.js

If the deployment will be in the same server (flavour 1), the bundle tar.gz file is already there, and we don't need to recompile the native packages. (Just jump the corresponding section above.)


