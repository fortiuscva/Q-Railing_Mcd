pageextension 50115 McdPostedSalesCreditMemo extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("Shipping Agent Service Code")
        {
            field(McdShippingNote; Rec.McdShippingNote)
            {
                ApplicationArea = All;
            }
        }
        addafter("Salesperson Code")
        {
            field(McdInnerSalespersonCode; Rec.McdOuterSalespersonCode)
            {
                ApplicationArea = All;
            }
        }
        modify("Salesperson Code")
        {
            Caption = 'Inner Salesperson Code';
        }
    }
}
