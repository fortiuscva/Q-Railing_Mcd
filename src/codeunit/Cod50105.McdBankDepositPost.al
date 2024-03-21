codeunit 50105 McdBankDepositPost
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Bank Deposit-Post", OnAfterBankDepositPost, '', false, false)]
    local procedure OnAfterBankDepositPost(BankDepositHeader: Record "Bank Deposit Header"; var PostedBankDepositHeader: Record "Posted Bank Deposit Header");
    var
        FromRecRef: RecordRef;
        ToRecRef: RecordRef;
        FromFieldRef: FieldRef;
        ToFieldRef: FieldRef;
        FromNo: Code[20];
        ToNo: Code[20];
        IsHandled: Boolean;
        DocumentAttachmentMgmt: codeunit "Document Attachment Mgmt";
        DocExists: Boolean;
        FromDocumentAttachment: Record "Document Attachment";
        ToDocumentAttachment: Record "Document Attachment";
    begin
        // Triggered when a posted sales cr. memo / posted sales invoice is created
        if BankDepositHeader.IsTemporary()then exit;
        if PostedBankDepositHeader.IsTemporary()then exit;
        FromRecRef.GetTable(BankDepositHeader);
        if PostedBankDepositHeader."No." <> '' then ToRecRef.GetTable(PostedBankDepositHeader);
        // DocumentAttachmentMgmt.CopyAttachmentsForPostedDocs(FromRecRef, ToRecRef);
        // FromRecRef.Get(BankDepositHeader.RecordId);
        // ToRecRef.Get(PostedBankDepositHeader.RecordId);
        // DocExists := DocumentAttachmentMgmt.AttachedDocumentsExist(FromRecRef);
        // if (DocExists = true) then begin
        //     //DocAttmtMgmt.CopyAttachments(FromRecRef, ToRecRef);
        //     FromDocumentAttachment.SetRange("Table ID", FromRecRef.Number);
        //     case FromRecRef.Number() of
        //         DATABASE::"Bank Deposit Header":
        //             begin
        //                 FromFieldRef := FromRecRef.Field(1);
        //                 FromNo := FromFieldRef.Value();
        //                 FromDocumentAttachment.SetRange("No.", FromNo);
        //             end;
        //     end;
        FromDocumentAttachment.SetRange("Table ID", 1690);
        FromDocumentAttachment.SetRange("No.", BankDepositHeader."No.");
        if FromDocumentAttachment.FindSet()then repeat Clear(ToDocumentAttachment);
                ToDocumentAttachment.Init();
                ToDocumentAttachment.TransferFields(FromDocumentAttachment);
                ToDocumentAttachment.Validate("Table ID", 1691);
                ToDocumentAttachment.Validate("No.", PostedBankDepositHeader."No.");
                /* case ToRecRef.Number() of
                    DATABASE::"Posted Bank Deposit Header":
                        begin
                            ToFieldRef := ToRecRef.Field(1);
                            ToNo := ToFieldRef.Value();
                            ToDocumentAttachment.Validate("No.", ToNo);
                        end;

                end; */
                if not ToDocumentAttachment.Insert(true)then;
                ToDocumentAttachment."Attached Date":=FromDocumentAttachment."Attached Date";
                ToDocumentAttachment.Modify();
            until FromDocumentAttachment.Next() = 0;
    end;
}
