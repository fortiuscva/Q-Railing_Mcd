pageextension 50104 McdPurchaseOrderSubform extends "Purchase Order Subform"
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
