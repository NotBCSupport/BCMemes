page 50305 "NBCS My Meme FactBox"
{
    PageType = CardPart;
    //ApplicationArea = All;
    //UsageCategory = Administration;
    SourceTable = "NBCS My Meme";
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
                    ToolTip = 'Shows the Image';
                }
            }
        }
    }
}