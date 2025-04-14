function td -a dir
    if test -n "$dir"
        set proj $dir
    else
        set proj (basename $PWD)
    end

    set todofile $proj.taskpaper

    if test ! -e $todofile
        touch $todofile
        echo -e "Inbox:\n$proj:\n\tNew Features:\n\tIdeas:\n\tBugs:\nArchive:\nSearch Definitions:\n\tTop Priority @search(@priority = 5 and not @done)\n\tHigh Priority @search(@priority > 3 and not @done)\n\tMaybe @search(@maybe)\n\tNext @search(@na and not @done and not project = \"Archive\")\n" >>$todofile
    end

    $EDITOR $todofile
end
