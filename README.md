# stest

## Setup

This solution requires a reasonably recent ChefDK and Vagrant/VirtualBox installed - I used chefdk 0.13.21, vagrant 1.8.1 and virtualbox 5.0.2-102096 on Linux Mint 17.3.  If you don't have these, running the 'setup.sh' script via sudo should install them on an Ubuntu/Debian family box.

It will also install the vagrant-vbguest and vagrant-berkshelf plugins.  Uninstall these manually with 'vagrant plugin uninstall XXX' if no longer wanted

## Build

Run './build.sh' to build and test all nodes, which will call setup.sh for you if it detects vagrant as missing.

Otherwise initialize a shell with

    eval "$(chef shell-init bash)"

and issue the build-everything command:

    rake all

## Notes

This test is instructed to be delivered in a single repo, but really should be split.

The sample_app.go should be in it's own repo, using CI to publish a binary that is versioned and retrieved by URL rather than built on the target box (e.g. using stest::deploy_app rather than build_app, but chef is a poor application deployment method).

The cookbook could be split into two - depending on likelihood of reuse of component parts and future features/complexity expected.  Again, CI could produce a berks package that would be applied to the nodes in a more production ready fashion than I am with Vagrant.

Unfortunately I ran out of time before adding the CI options above, which I had intended to run via CircleCI's free tier & deploy to AWS nodes created using terraform.  I suspect this is already getting near the over-engineered system you explicitly warn against...
