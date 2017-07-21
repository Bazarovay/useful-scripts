# useful-scripts
Includes shell/ruby/python scripts and commands

- Jekyll create posts from command line - Ruby
- Dawn.tv run last news headlines from youtube live video command:
`livestreamer --hls-live-edge=`date "+%M*60/2+%S/2" | bc` --player="ffplay -vf "setpts=.5*PTS" -af "atempo=2.0"" https://www.youtube.com/watch?v=oDcjsdJMSoE best`
