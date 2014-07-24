#!/usr/bin/awk
#Note I just did this to learn some awk. don't tase me. 

#Usage:
#tty=$(tty); w -h | awk -vtty=${tty#/*/} -vmaxtime=5 -f getusers -


{time = "minute(s)"}

{
  if ($2 ~ /pts/ && $2 != tty )
  idle = $5
  else next

 }

{
  if ($5 ~/m$/) {
    split(idle, t, ":")
    idle = t[1] * 60 + t[2]
  }

else if ($5 ~/s$/) {
  split(idle, u, ".")
  idle = u[1] / 60
    if (idle < 1) {
      time = "second(s)"
      idle = idle * 60
    }

  }
else if ($5 ~/:/ ) {
    split(idle, t, ":")
    idle = t[1]
  }
}

{
if (idle < maxtime || time == "second(s)"  ) {
  toupper($1)
  sub(/r/, "R")
  print "User",$1,"is logged in from",$3,"and has only been idle for", idle, time, "Running program", $NF
  }
}
