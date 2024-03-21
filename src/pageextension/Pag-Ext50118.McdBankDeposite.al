pageextension 50118 McdBankDeposite extends "Bank Deposit"
{
    layout
    {
        addfirst(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID"=CONST(Database::"Bank Deposit Header"), "No."=field("No.");
            }
        }
    }
}
