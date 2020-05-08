main()
{
    thread track1();
    thread track2();
    thread track3();
    thread track4();
    thread track5();
    thread track6();
    thread track7();
    thread track8();
    thread trackOff();
    thread trackRdm();

}
 
track1()
{
    trig=getent("title1","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(!isdefined(who.astralMusic) || !who.astralMusic)
            who musicSelected(true,"title1",false);
    }
}
 
track2()
{
    trig=getent("title2","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(!isdefined(who.astralMusic) || !who.astralMusic)
            who musicSelected(true,"title2",false);
    }
}
 
track3()
{
    trig=getent("title3","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(!isdefined(who.astralMusic) || !who.astralMusic)
            who musicSelected(true,"title3",false);
    }
}
 
track4()
{
    trig=getent("title4","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(!isdefined(who.astralMusic) || !who.astralMusic)
            who musicSelected(true,"title4",false);
    }
}
 
track5()
{
    trig=getent("title5","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(!isdefined(who.astralMusic) || !who.astralMusic)
            who musicSelected(true,"title5",false);
    }
}
 
track6()
{
    trig=getent("title6","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(!isdefined(who.astralMusic) || !who.astralMusic)
            who musicSelected(true,"title6",false);
    }
}
track8()
{
    trig=getent("sec_t2","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(!isdefined(who.astralMusic) || !who.astralMusic)
            who musicSelected(true,"title8",false);
    }
}
track7()
{
    trig=getent("sec_t1","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(!isdefined(who.astralMusic) || !who.astralMusic)
            who musicSelected(true,"title7",false);
    }
}
 
trackOff()
{
    trig=getent("musicstop","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(isdefined(who.astralMusic) && who.astralMusic==true)
        {
            who iprintln("^1Stopped ^7music");
            who.astralMusic=false;

            if(isdefined(who.astralMusicRdm))
                who.astralMusicRdm=false;

            for(i=1;i<9;i++)
            {
                who stoplocalsound("title"+i);
                wait .05;
            }
        }
    }
}
 
trackRdm()
{
    trig=getent("rndmsng","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(!isdefined(who.astralMusic) || !who.astralMusic)
            who randomMusic();
    }
}
 
randomMusic()
{
    self.astralMusicRdm=true;
    pvc=0;
    while(self.astralMusicRdm)
    {
        nvc=(1+randomint(8));
        if(pvc!=nvc)
        {
            pvc=nvc;
            self playanddefine("title"+nvc);

            wait getsonglenght("title"+nvc);
            self stoplocalsound("title"+nvc);
            wait 1;
        }
        else
        {
            if(pvc<9)
                pvc=pvc+1;
            else
                pvc=1;
        }
    }
}
 
playanddefine(what)
{
    self iprintln("Currently playing: ^1"+getsongname(what));
    self playlocalsound(what);
}
 
getsongname(song)
{
    switch(song)
    {
        case "title1":  song="Tycho - Awake";                   break;
        case "title2":  song="Satchmode - Best Intentions";     break;
        case "title3":  song="Jaymes Young - Fragments";        break;
        case "title4":  song="Feint - My Sunset";               break;
        case "title5":  song="Fake Static Noise - Fall";        break;
        case "title6":  song="Evocativ - The Lovers";           break;
        case "title7":  song="Ember Island, Radiohead - Creep"; break;
        case "title8":  song="TLC - No Scrubs";                  break;
    }
    return song;
}
 
getsonglenght(song)
{
    switch(song)
    {
        case "title1":  song=281;   break;
        case "title2":  song=270;   break;
        case "title3":  song=252;   break;
        case "title4":  song=323;   break;
        case "title5":  song=309;   break;
        case "title6":  song=242;   break;
        case "title7":  song=227;   break;
        case "title8":  song=214;   break;
    }
    return song;
}
 
musicSelected(state1,alias,state2)
{
    ambientstop();
    musicstop();
 
    self.astralMusic=state1;
    self playlocalsound(alias);
    self iprintln("Currently playing: ^1"+getsongname(alias));
    wait getsonglenght(alias);
    self.astralMusic=state2;
}
