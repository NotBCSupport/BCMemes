page 50304 "NBCS Setup Card"
{
    Caption = 'Meme Setup';
    PageType = Card;
    SourceTable = "NBCS Setup";
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {

        area(content)
        {
            group(General)
            {

                field(Username; "Username")
                {
                    ApplicationArea = All;
                    ToolTip = 'Username of your Imgflip Account';
                }

                field(Password; "Password")
                {
                    ApplicationArea = All;
                    ToolTip = 'Password of your Imgflip Account';
                }

            }
        }
    }

}