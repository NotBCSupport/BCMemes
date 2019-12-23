page 50300 "NBCS Memes"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "NBCS Meme";
    Editable = false;
    Caption = 'Available Memes';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                Caption = 'Memes';

                field(Image; Image)
                {
                    ApplicationArea = All;
                    ToolTip = 'String.Empty()';
                }
                field(id; Id)
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'This is the id of the meme template in Imgflip';
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'This is the name of the meme template';
                }
                field(BoxCount; BoxCount)
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'You don''t have to care about this because i didn''t implement more than two textes per meme';
                }
                field(Height; Height)
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'I don''t want to write more tooltps..';
                }
                field(Width; Width)
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'really this is the last one!';
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
            action(GetMemes)
            {
                ApplicationArea = All;
                Caption = 'Reload available memes';
                ToolTip = 'Reloads the available memes';
                Image = Trace;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction();
                begin
                    ReloadMemes();
                    CurrPage.Update(false);
                end;

            }

            action(CaptionThisMeme)
            {
                ApplicationArea = All;
                Caption = 'Caption this meme';
                ToolTip = 'Caption this meme, Dude!';
                Image = New;
                Promoted = true;
                PromotedOnly = true;
                RunObject = Page "NBCS Create Meme";
                RunPageLink = Id = field(Id);
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not FindFirst() then begin
            ReloadMemes();
            CurrPage.Update(false);
        end;
    end;
}