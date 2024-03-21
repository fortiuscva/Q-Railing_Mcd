pageextension 50105 McdPostedPurchaseRcptSubfo extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field("Order Address Code"; Rec."Order Address Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
