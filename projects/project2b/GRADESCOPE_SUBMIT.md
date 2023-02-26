# New Submission prosses

*Note the new submission process is completely optional and the `gradescope_submit` command from previous projects will continue to work.*

We are working on a new version of the `gradescope_submit` command and would appreciate student helping us
to test the new process with project 2b. The new submission process is described below.

## Installing new command

To install the new `submit` command complete the following steps:

  1. Update your `opam` repository by running: `opam update`
  2. Install the new version of submit by running: `opam install gradescope_submit`
  
     *Note: This will not conflict with the `gradescope_submit` command from previous projects*
     
## Link Github to Gradescope

Log into your gradescope account and go to your account settings. Scroll down to the `Linked Accounts` section. If you do not already
have your Github account linked here, click the `Link a GitHub account` button and log into your Github account.
  
## Using the new submit command

First make sure all your changes are pushed to github using the `git add`, `git commit`, and `git push` commands.

Next, to submit your project using the new submit command you can run `submit` from your project directory.

The new `submit` comand will pull your code from GitHub, not your local files. If you do not push your changes to GitHub,
they will not be uploaded to gradescope.
