page 50301 "NBCS Meme FactBox"
{
    PageType = CardPart;
    //ApplicationArea = All;
    //UsageCategory = Administration;
    SourceTable = "NBCS Meme";
    Caption = 'Memebox';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Meme';
                field(Image; Image)
                {
                    ApplicationArea = All;
                    ToolTip = 'Mee Mee';
                }
            }
        }
    }
}