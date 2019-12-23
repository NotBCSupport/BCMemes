page 50302 "NBCS Create Meme"
{
    Caption = 'Create meme';
    PageType = Card;
    SourceTable = "NBCS Meme";
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {

        area(content)
        {
            group(General)
            {

                field(TemplateName; "Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Name of the meme template';
                    Editable = false;

                }
                field(MemeNameField; MemeName)
                {
                    ApplicationArea = All;
                    Caption = 'Name (Optional)';
                    ToolTip = 'Name your meme to find it with this name in your "My Memes" collection. But you can skip this if you are to lazy.';
                }
                field(TopTextField; TopText)
                {
                    ApplicationArea = All;
                    Caption = 'Top text';
                    ToolTip = 'The top text of the meme. If your text is not placed where you wanted it, blame Imgflip :P';

                }
                field(BottomTextField; BottomText)
                {
                    ApplicationArea = All;
                    Caption = 'Bottom text';
                    ToolTip = 'The bottom text of the meme. If your text is not placed where you wanted it, blame Imgflip :P';

                }

            }
        }
        area(Factboxes)
        {
            part("MemeFactBox"; "NBCS Meme FactBox")
            {
                ApplicationArea = All;
                SubPageLink = Id = field(Id);
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(MakeMeme)
            {
                Caption = 'Make Meme';
                ToolTip = 'Makes the Meme';
                ApplicationArea = All;
                Image = CreateRating;
                Promoted = true;
                PromotedOnly = true;


                trigger OnAction()
                var
                    MyMeme: Record "NBCS My Meme";

                    Client: HttpClient;
                    RequestContent: HttpContent;
                    Response: HttpResponseMessage;
                    ContentText: Text;

                    JsonResulObject: JsonObject;
                    DataToken: JsonToken;
                    MemeToken: JsonToken;

                    MemeUrl: Text;
                    MemePageUrl: Text;
                    MemeUrlOutStream: OutStream;
                    MemePageUrlOutStream: OutStream;
                    ImageInStream: InStream;
                begin
                    // Uploead Meme
                    Client.Post('https://api.imgflip.com/caption_image' +
                        '?template_id=' + Format(Id) +
                        '&username=7633bxhbta' +
                        '&password=7633bxhbta' +
                        '&text0=' + TopText +
                        '&text1=' + BottomText, RequestContent, Response);


                    Response.Content().ReadAs(ContentText);
                    JsonResulObject.ReadFrom(ContentText);
                    JsonResulObject.Get('data', DataToken);
                    DataToken.AsObject().Get('url', MemeToken);
                    MemeUrl := MemeToken.AsValue().AsText();

                    DataToken.AsObject().Get('page_url', MemeToken);
                    MemePageUrl := MemeToken.AsValue().AsText();

                    Client.Get(MemeUrl, Response);
                    Response.Content().ReadAs(ImageInStream);


                    //Insert MyMeme
                    MyMeme.Init();
                    MyMeme."Entry No." := 0;
                    MyMeme."Meme Url".CreateOutStream(MemeUrlOutStream);
                    MemeUrlOutStream.WriteText(MemeUrl);

                    MyMeme."Page Url".CreateOutStream(MemePageUrlOutStream);
                    MemePageUrlOutStream.WriteText(MemePageUrl);

                    MyMeme.Name := CopyStr(MemeName, 1, MaxStrLen(MyMeme.Name));
                    MyMeme."Template Name" := Name;

                    MyMeme.Image.ImportStream(ImageInStream, MyMeme.Name);
                    MyMeme.Insert();

                    // Back to Meme list
                    CurrPage.Close();
                end;
            }
        }
    }


    var
        TopText: Text;
        BottomText: Text;
        MemeName: Text;

}