page 50303 "NBCS My Memes"
{
    Caption = 'My Memes';
    PageType = List;
    SourceTable = "NBCS My Meme";
    UsageCategory = Lists;
    InsertAllowed = false;
    ApplicationArea = All;

    layout
    {

        area(content)
        {
            repeater(Group)
            {
                field(Image; Image)
                {
                    ApplicationArea = All;
                    ToolTip = 'Realy? Why do you need a tooltip this is obviously your meme!';
                }
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Primary key of the table';
                }
                field(Name; "Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Name of the meme (you defined this ;-) )';
                }
                field("Template Name"; "Template Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'The name of the meme template used to create this meme';
                }


            }
        }
        area(FactBoxes)
        {
            part("NBCS My Meme FactBox"; "NBCS My Meme FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Entry No." = field("Entry No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowImage)
            {
                ApplicationArea = All;
                Caption = 'Show my Image';
                ToolTip = 'Why not show your image. Do whatever you want, show it, save it.. I think thats it.';
                Image = Picture;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    MemeUrlInStream: InStream;
                    MemeUrl: Text;
                begin
                    CalcFields("Meme Url");
                    "Meme Url".CreateInStream(MemeUrlInStream);
                    MemeUrlInStream.ReadText(MemeUrl);
                    Hyperlink(MemeUrl);
                end;
            }

            action(ShowImageOnImgflip)
            {
                ApplicationArea = All;
                Caption = 'Show on Imgflip';
                ToolTip = 'Let''s see how famous your meme is on Imgflip';
                Image = LaunchWeb;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    MemePageUrlInStream: InStream;
                    MemePageUrl: Text;
                begin
                    CalcFields("Page Url");
                    "Page Url".CreateInStream(MemePageUrlInStream);
                    MemePageUrlInStream.ReadText(MemePageUrl);
                    Hyperlink(MemePageUrl);
                end;
            }
            action(CreateNewMeme)
            {
                ApplicationArea = All;
                Caption = 'Create new Meme';
                ToolTip = 'I belive in you. You can do this. Just do it!';
                Image = NewDocument;
                RunObject = Page "NBCS Memes";
                Promoted = true;
                PromotedOnly = true;

            }
        }
    }

}