pageextension 50121 McdReqEorksheet extends "Req. Worksheet"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ItemSupplyFactbox; TOMItemSupplyFactbox)
            {
                ApplicationArea = All;
                SubPageLink = "No."=field("No.");
            }
        }
        addafter(ItemSupplyFactbox)
        {
            part(ItemDemandFactbox; TOMItemDemandFactbox)
            {
                ApplicationArea = All;
                SubPageLink = "No."=field("No.");
            }
        }
    }
}
