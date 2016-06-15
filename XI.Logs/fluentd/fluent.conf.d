<source>
  @type tail
  path ./test.log
  pos_file ./pos_file
  format /^(?<time>[^ ]* [^ ]*) (?<level>[^ ]*) (?<message>.*)/
  # format ^\[(?<time>[^\]]*)\] (?<level>[^ ]*) (?<message>.*)
  time_format %Y-%m-%d %H:%M:%S,%L
  tag testlog
</source>

<match testlog>
  @type file
  path ./match.log
</match>
