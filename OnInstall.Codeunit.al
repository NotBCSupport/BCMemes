codeunit 50300 "NBCS On Install"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        Setup: Record "NBCS Setup";
    begin
        Setup.InitSetup();
        Setup.Username := '7633bxhbta';
        Setup.Password := '7633bxhbta';
        Setup.Modify();
    end;
}