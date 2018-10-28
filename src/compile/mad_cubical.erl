-module(mad_cubical).
-copyright('Maxim Sokhatsky').
-compile(export_all).

compile(File,_Inc,_Bin,_Opt,_Deps) ->
    {_,Res,Msg} = sh:run(sh:executable("cubical"), ["-b", File], binary, "."),
    case Res of
         1 -> true;
         0 -> case binary:match(Msg,[<<"File loaded.">>]) of
                   nomatch -> io:format("Error: ~p~n",[Msg]), true;
                   _ -> io:format("OK: ~p.~n",[filename:basename(File)]), false end end.
