table 50300 "NBCS Meme"
{
    DataClassification = CustomerContent;
    Caption = 'Meme';

    fields
    {
        field(1; Id; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Id';
        }
        field(2; Name; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(3; Url; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'URL';
        }
        field(4; Height; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Height';
        }
        field(5; Width; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Width';
        }
        field(6; BoxCount; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Box Count';
        }
        field(10; Image; Media)
        {
            DataClassification = CustomerContent;
            Caption = 'Image';
        }
    }

    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; Name, Image)
        {

        }
    }


    procedure ReloadMemes()
    var
        Meme: Record "NBCS Meme";
        Client: HttpClient;
        Response: HttpResponseMessage;
        ContentText: Text;

        JsonResulObject: JsonObject;
        DataToken: JsonToken;
        MemesToken: JsonToken;
        MemesArray: JsonArray;
        MemeObject: JsonObject;
        MemeToken: JsonToken;

        MemeId: Integer;
        MemeName: Text;
        MemeUrl: Text;
        MemeWidth: Integer;
        MemeHeight: Integer;
        MemeBoxCount: Integer;

        UrlOutStream: OutStream;
        ImageInStream: InStream;

        i: Integer;
    begin

        Meme.Reset();
        Meme.DeleteAll();

        Client.Get('https://api.imgflip.com/get_memes', Response);
        Response.Content().ReadAs(ContentText);
        JsonResulObject.ReadFrom(ContentText);
        JsonResulObject.Get('data', DataToken);
        DataToken.AsObject().Get('memes', MemesToken);
        MemesArray := MemesToken.AsArray();
        for i := 0 to MemesArray.Count() - 1 do begin
            MemesArray.Get(i, MemeToken);
            MemeObject := MemeToken.AsObject();

            //"id": "61579",
            MemeObject.Get('id', MemeToken);
            Evaluate(MemeId, MemeToken.AsValue().AsText());

            // "name": "One Does Not Simply",
            MemeObject.Get('name', MemeToken);
            MemeName := MemeToken.AsValue().AsText();

            // "url": "https://i.imgflip.com/1bij.jpg",
            MemeObject.Get('url', MemeToken);
            MemeUrl := MemeToken.AsValue().AsText();

            // "width": 568,
            MemeObject.Get('width', MemeToken);
            MemeWidth := MemeToken.AsValue().AsInteger();

            // "height": 335,
            MemeObject.Get('height', MemeToken);
            MemeHeight := MemeToken.AsValue().AsInteger();

            // "box_count": 2
            MemeObject.Get('box_count', MemeToken);
            MemeBoxCount := MemeToken.AsValue().AsInteger();



            if MemeBoxCount = 2 then
                if not Meme.Get(MemeId) then begin
                    Meme.Init();
                    Meme.Id := MemeId;
                    Meme.Name := CopyStr(MemeName, 1, MaxStrLen(Meme.Name));

                    Meme.Url.CreateOutStream(UrlOutStream);
                    UrlOutStream.WriteText(MemeUrl);

                    Meme.Width := MemeWidth;
                    Meme.Height := MemeHeight;
                    Meme.BoxCount := MemeBoxCount;

                    Client.Get(MemeUrl, Response);
                    Response.Content().ReadAs(ImageInStream);
                    Meme.Image.ImportStream(ImageInStream, Meme.Name);
                    Meme.Insert();
                end;

        end;
        Message('Available Memes loaded from Imgflip');
    end;

}