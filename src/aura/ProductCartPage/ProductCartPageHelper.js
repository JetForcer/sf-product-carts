({
    doReloadCartItems: function (cmp, evt) {
        var opportunityId = cmp.get('v.recordId');

        var cartItemsAction = cmp.get("c.getCartItemsByOpportunityId");
        cartItemsAction.setParams({
            "opportunityId": opportunityId
        });

        cartItemsAction.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.cartItems", response.getReturnValue());
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(cartItemsAction);
    },

    fireCartItemRemoval: function (opportunityId) {
        var cartItemRemovalEvent = $A.get("e.c:CartItemRemovalEvent");
        cartItemRemovalEvent.fire({
            "opportunityId": opportunityId
        });
    }
});