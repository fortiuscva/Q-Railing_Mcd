pageextension 50120 McdPurchaseOrder extends "Purchase Order"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ItemSupplyFactbox; TOMItemSupplyFactbox)
            {
                ApplicationArea = All;
                Provider = PurchLines;
                SubPageLink = "No."=field("No.");
            }
        }
        addafter(ItemSupplyFactbox)
        {
            part(ItemDemandFactbox; TOMItemDemandFactbox)
            {
                ApplicationArea = All;
                Provider = PurchLines;
                SubPageLink = "No."=field("No.");
            }
        }
        modify("Location Code")
        {
            Editable = true;
        }
        modify("Ship-to Name")
        {
            Editable = true;
        }
        modify("Ship-to Address")
        {
            Editable = true;
        }
        modify("Ship-to Address 2")
        {
            Editable = true;
        }
        modify("Ship-to City")
        {
            Editable = true;
        }
        modify("Ship-to County")
        {
            Editable = true;
        }
        modify("Ship-to Post Code")
        {
            Editable = true;
        }
        modify("Ship-to Country/Region Code")
        {
            Editable = true;
        }
        modify("Ship-to Contact")
        {
            Editable = true;
        }
        modify("Ship-to UPS Zone")
        {
            Editable = true;
        }
    }
}
