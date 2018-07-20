import std.net.curl, std.stdio;

void main()
{
  auto http = HTTP("lobste.rs/newest.json");
  http.onReceive = (ubyte[] data)
    {
     string body = (cast(immutable(char)*)data)[0..data.length];
     writeln(body);
     return data.length;
    };
  http.perform();
}
