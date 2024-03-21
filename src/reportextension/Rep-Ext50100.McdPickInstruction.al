reportextension 50100 McdPickInstruction extends "Pick Instruction"
{
    RDLCLayout = './src/layout/McdPickInstruction.rdl';

    dataset
    {
        add("Sales Header")
        {
            column(Shipping_Agent_Code; "Shipping Agent Code")
            {
            }
            column(Shipping_Agent_Service_Code; "Shipping Agent Service Code")
            {
            }
            column(McdShippingNote; McdShippingNote)
            {
            }
        }
        add("Sales Line")
        {
            column(ItemPicture; TenantMedia.Content)
            {
            }
        }
        add(CopyLoop)
        {
            column(CompanyInfoPicture; CompanyInfo3.Picture)
            {
            }
        }
        modify("Sales Line")
        {
        trigger OnAfterAfterGetRecord()
        begin
            clear(TenantMedia);
            //>>Mcd
            if type = Type::Item then if item.get("No.")then if item.Picture.Count > 0 then begin
                        TenantMedia.Get(item.Picture.Item(1));
                        TenantMedia.CalcFields(Content);
                    end;
        //<<Mcd
        end;
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo3.get;
        CompanyInfo3.CalcFields(Picture);
    end;
    var CompanyInfo3: Record "Company Information";
    TenantMedia: Record "Tenant Media";
    item: Record Item;
}
