tableextension 50102 McdPurchaseLine extends "Purchase Line"
{
    fields
    {
        field(50000; "Order Address Code"; Code[10])
        {
            Caption = 'Alternate Vendor Address Code';
            TableRelation = "Order Address".Code where("Vendor No."=field("Buy-from Vendor No."));
        }
    }
}
