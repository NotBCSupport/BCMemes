table 50301 "NBCS My Meme"
{
    DataClassification = CustomerContent;
    Caption = 'My Meme';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Caption = 'Entry No.';

        }
        field(2; Name; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(3; "Meme Url"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Meme URL';
        }
        field(4; "Page Url"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Page URL';
        }
        field(5; Image; Media)
        {
            DataClassification = CustomerContent;
            Caption = 'Image';
        }
        field(6; "Template Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Template Name';
        }
    }

    keys
    {
        key(PK; "Entry No.")
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

}