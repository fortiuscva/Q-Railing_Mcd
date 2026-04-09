pageextension 50119 McdPostedBankDeposit extends "Posted Bank Deposit"
{
    layout
    {
        addfirst(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::"Posted Bank Deposit Header"), "No." = field("No.");
            }
        }
    }
}
