{**
*
* @author    Amazzing <mail@amazzing.ru>
* @copyright 2007-2018 Amazzing
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
* NOTE: this file is extendable. You can override only selected blocks in your template.
* Path for extending: 'modules/easycarousels/views/templates/hook/product-item-16.tpl'
*
**}

{block name='product_item'}
{$has_buttons = !empty($settings.add_to_cart) || !empty($settings.view_more)}
<div class="product-container{if !empty($settings.price)} has-price{/if}{if !empty($settings.stock)} has-stock{/if}{if $has_buttons} has-buttons{/if}" itemscope itemtype="http://schema.org/Product">
<div class="left-block">
    <div class="product-image-container">

        {block name='product_image'}
        {if $settings.image_type != '--'}
            {$img_type = $settings.image_type}
            {if !empty($product.legend)}{$legend = $product.legend}{else}{$legend = $product.name}{/if}
            <a class="product_img_link"    href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
                <img
                    class="replace-2x{if !empty($product.second_img_src)} primary-image{/if}"
                    src="{$product.img_src|escape:'html':'UTF-8'}"
                    alt="{$legend|escape:'html':'UTF-8'}"
                    {if !empty($image_sizes[$img_type])}
                        width="{$image_sizes[$img_type]['width']|escape:'html':'UTF-8'}"
                        height="{$image_sizes[$img_type]['height']|escape:'html':'UTF-8'}"
                    {/if}
                    itemprop="image"
                />
                {hook h='productImageHover' id_product = $product.id_product}
                {* if !empty($product.second_img_src)}
                    <img
                        class="replace-2x secondary-image"
                        src="{$product.second_img_src|escape:'html':'UTF-8'}"
                        alt="{$legend|escape:'html':'UTF-8'}"
                        {if !empty($image_sizes[$img_type])}
                            width="{$image_sizes[$img_type]['width']|escape:'html':'UTF-8'}"
                            height="{$image_sizes[$img_type]['height']|escape:'html':'UTF-8'}"
                        {/if}
                    />
                {/if *}
        </a>
        {/if}
        {/block}

        {block name='product_quick_view'}
        {if !empty($settings.quick_view)}
            <a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
                <span>{l s='Quick view' mod='easycarousels'}</span>
            </a>
        {/if}
        {/block}

        {block name='product_stickers'}
        {if !empty($settings.stickers)}
            {if isset($product.new) && $product.new == 1}
                <a class="new-box" href="{$product.link|escape:'html':'UTF-8'}"><span class="new-label">{l s='New' mod='easycarousels'}</span></a>
            {/if}
            {if !empty($product.on_sale) && !empty($product.show_price) && !$PS_CATALOG_MODE}
                <a class="sale-box" href="{$product.link|escape:'html':'UTF-8'}"><span class="sale-label">{l s='Sale!' mod='easycarousels'}</span></a>
            {/if}
        {/if}
        {/block}

    </div>

    {if !empty($settings.displayProductDeliveryTime)}{hook h="displayProductDeliveryTime" product=$product}{/if}
    {if !empty($settings.displayProductPriceBlock)}{hook h="displayProductPriceBlock" product=$product type="weight"}{/if}

</div>
<div class="right-block">

    {block name='product_title'}
    {if !empty($settings.title)}
        <h5 itemprop="name" class="product-title{if !empty($settings.title_one_line)} nowrap{/if}">
            {if !empty($product.pack_quantity)}{$product.pack_quantity|intval} x {/if}
            <a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">
                {$product.name|truncate:$settings.title:'...'|escape:'html':'UTF-8'}
            </a>
        </h5>
    {/if}
    {/block}

    {block name='product_other_fields'}
    {if !empty($settings.reference)}
        <div class="prop-line product-reference nowrap"><span>{$product.reference|escape:'html':'UTF-8'}</span></div>
    {/if}
    {if !empty($settings.product_cat) && !empty($product.cat_url)}
        <div class="prop-line product-category nowrap">
            <a class="cat-name " href="{$product.cat_url|escape:'html':'UTF-8'}" title="{$product.cat_name|escape:'html':'UTF-8'}">{$product.cat_name|truncate:45:'...'|escape:'html':'UTF-8'}</a>
        </div>
    {/if}
    {if !empty($settings.product_man) && $product.id_manufacturer && $product.man_name && !empty($product.man_url)}
        <div class="prop-line product-manufacturer nowrap">
            <a class="man-name" href="{$product.man_url|escape:'html':'UTF-8'}" title="{$product.man_name|escape:'html':'UTF-8'}">
            {if !empty($product.man_img_src)}
                <img src="{$product.man_img_src|escape:'html':'UTF-8'}" class="product-manufacturer-img">
            {else}
                {$product.man_name|truncate:45:'...'|escape:'html':'UTF-8'}
            {/if}
            </a>
        </div>
    {/if}
    {if !empty($settings.description)}
        <div class="prop-line product-description-short" itemprop="description">
            {$product.description_short|strip_tags:'UTF-8'|truncate:$settings.description:'...'|escape:'html':'UTF-8'}
        </div>
    {/if}
    {/block}

    {if !empty($settings.displayProductListReviews)}
        {hook h='displayProductListReviews' product=$product hide_thumbnails=empty($settings.thumbnails)|intval}
    {/if}

    {block name='product_price'}
    {if ($settings.price && !$PS_CATALOG_MODE && (!empty($product.show_price) || !empty($product.available_for_order)))}
        <div class="content_price main" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
            {if !empty($product.show_price) && !isset($restricted_country_mode)}
                {if !$priceDisplay}{$price = $product.price}{else}{$price = $product.price_tax_exc}{/if}
                <span class="price product-price">{convertPrice price=$price}</span>
                <meta itemprop="price" content="{$price|escape:'html':'UTF-8'}" />
                <meta itemprop="priceCurrency" content="{$currency_iso_code|escape:'html':'UTF-8'}" />
                {if !empty($product.stock_txt)}
                    <meta itemprop="availability" content="{$product.stock_txt|escape:'html':'UTF-8'}" />
                {/if}
                {if !empty($product.specific_prices) && !empty($product.specific_prices.reduction)}
                    {if !empty($settings.displayProductPriceBlock)}{hook h="displayProductPriceBlock" product=$product type="old_price"}{/if}
                    <span class="old-price product-price">{displayWtPrice p=$product.price_without_reduction}</span>
                    {if $product.specific_prices.reduction_type == 'percentage'}
                        <span class="price-percent-reduction">-{($product.specific_prices.reduction * 100)|escape:'html':'UTF-8'}%</span>
                    {/if}
                {/if}
                {if !empty($settings.displayProductPriceBlock)}
                    {hook h="displayProductPriceBlock" product=$product type="price"}
                    {hook h="displayProductPriceBlock" product=$product type="unit_price"}
                {/if}
            {/if}
        </div>
    {/if}
    {/block}

    {block name='product_buttons'}
    {if $has_buttons}
    <div class="button-container">
        {if $settings.add_to_cart}
            {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE}
                {if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
                    {capture}add=1&amp;id_product={$product.id_product|intval}{if isset($static_token)}&amp;token={$static_token|escape:'html':'UTF-8'}{/if}{/capture}
                    <a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='easycarousels'}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity > 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">
                        <span>{l s='Add to cart' mod='easycarousels'}</span>
                    </a>
                {else}
                    <span class="button ajax_add_to_cart_button btn btn-default disabled">
                        <span>{l s='Add to cart' mod='easycarousels'}</span>
                    </span>
                {/if}
            {/if}
        {/if}
        {if $settings.view_more}
            <a class="button lnk_view btn btn-default" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View' mod='easycarousels'}">
                <span>{if (isset($product.customization_required) && $product.customization_required)}{l s='Customize' mod='easycarousels'}{else}{l s='More' mod='easycarousels'}{/if}</span>
            </a>
        {/if}
    </div>
    {/if}
    {/block}

    {block name='product_colors'}
    {if isset($product.color_list)}
        <div class="color-list-container">{$product.color_list}{* cannot be escaped *}</div>
    {/if}
    {/block}

    {block name='product_availability'}
    {if !empty($product.stock_status) && !isset($restricted_country_mode)}
        <span class="product-availability label-{if $product.stock_status == 'not_available'}danger{elseif $product.stock_status == 'available_different'}warning{else}success{/if}">
            {$product.stock_txt|escape:'html':'UTF-8'}
        </span>
    {/if}
    {/block}

</div>
</div>
{/block}
{* since 2.5.5 *}
