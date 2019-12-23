table 50302 "NBCS Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Primary; Code[1])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary';
        }
        field(2; Username; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Username';
        }
        field(3; Password; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Password';
        }
    }

    keys
    {
        key(PK; Primary)
        {
            Clustered = true;
        }
    }

    procedure InitSetup()
    begin
        if not Get() then begin
            Init();
            Insert();
        end;
    end;

}