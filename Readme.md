


###Find running server and shut it down
```bash
pgrep -fl ruby
kill -9
```

###Start up server!
```bash
nohup bundle exec rackup -p 80 &
```
