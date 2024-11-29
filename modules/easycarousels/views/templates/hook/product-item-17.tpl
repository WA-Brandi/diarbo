{**
*
* @author    Amazzing <mail@amazzing.ru>
* @copyright 2007-2018 Amazzing
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
* NOTE: this file is extendable. You can override only selected blocks in your template.
* Path for extending: 'modules/easycarousels/views/templates/hook/product-item-17.tpl'
*
**}

{block name='product_item'}
<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
<div class="thumbnail-container">

    {block name='product_image'}
    {if $settings.image_type != '--'}
        {$image_type = $settings.image_type}
        <a href="{$product.url}" class="thumbnail product-thumbnail" itemprop="url">
            <img src="{$product.cover.bySize.$image_type.url}" alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:45:'...'}{/if}" class="{if !empty($product.second_img_src)}primary-image{/if}" width="" height="" >
            {if !empty($product.second_img_src)}
                <img src="{$product.second_img_src}" alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:45:'...'}{/if}" class="img-responsive secondary-image" itemprop="image" width="" height="" >
            {/if}
        </a>
    {/if}
    {/block}

        <div class="highlighted-informations">
    {block name='product_quick_view'}
    {if $settings.quick_view}
            <a href="#" class="quick-view" data-link-action="quickview">{l s='Quick view' d='Shop.Theme.Actions'}</a>
    {/if}
    {/block}
                {block name='product_features'}
                {if $product.grouped_features}
                <section class="product-features">
                    <p class="h6">{l s='Szczegóły produktu' d='Shop.Theme.Catalog'}</p>
                    <dl class="data-sheet">
                        {foreach from=$product.grouped_features item=feature}
                        <dt class="name">{$feature.name}</dt>
                        <dd class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
                        {/foreach}
                    </dl>
                </section>
                {/if}
                {/block}

        </div>

    {block name='product_variants'}{* can be optionally filled in extended file *}{/block}

    {block name='product_informations'}
    <div class="product-description">

        {block name='product_title'}
        {if !empty($settings.title)}
            <h5 class="product-title{if !empty($settings.title_one_line)} nowrap{/if}" itemprop="name"><a href="{$product.url}">{$product.name|truncate:$settings.title:'...'}</a></h5>
        {/if}
        {/block}

        {block name='product_other_fields'}
        {if !empty($settings.reference)}
            <div class="prop-line product-reference nowrap"><span>{$product.reference}</span></div>
        {/if}
        {if !empty($settings.product_cat) && !empty($product.cat_url)}
            <div class="prop-line product-category nowrap">
                <a class="cat-name " href="{$product.cat_url}" title="{$product.cat_name}">{$product.cat_name|truncate:45:'...'}</a>
            </div>
        {/if}
        {if !empty($settings.product_man) && $product.id_manufacturer && $product.man_name && !empty($product.man_url)}
            <div class="prop-line product-manufacturer nowrap">
                <a class="man-name" href="{$product.man_url}" title="{$product.man_name}">
                {if !empty($product.man_img_src)}
                    <img src="{$product.man_img_src}" class="product-manufacturer-img">
                {else}
                    {$product.man_name|truncate:45:'...'}
                {/if}
                </a>
            </div>
        {/if}
        {if !empty($settings.description)}
            <div class="prop-line product-description-short" itemprop="description">
                {$product.description_short|strip_tags:'UTF-8'|truncate:$settings.description:'...'}
            </div>
        {/if}
        {if !empty($settings.stock) && $product.availability_message}
            <div class="prop-line product-availability {$product.availability}">
                <span class="inline-block nowrap">{$product.availability_message}</span>
            </div>
        {/if}
        {/block}

        {block name='product_price'}
        {if $settings.price && $product.show_price}
            <div class="product-price-and-shipping" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                {if $product.has_discount}
                    {if $settings.displayProductPriceBlock}
                        {hook h='displayProductPriceBlock' product=$product type="old_price"}
                    {/if}
                    <span class="regular-price">{$product.regular_price}</span>
                {/if}
                {if $settings.displayProductPriceBlock}
                    {hook h='displayProductPriceBlock' product=$product type="before_price"}
                {/if}
                <span class="price">{$product.price}</span>
                <meta itemprop="price" content="{$product.price_amount}" />
                <meta itemprop="priceCurrency" content="{$currency_iso_code}" />
                {if !empty($settings.stock) && $product.availability_message}
                    <meta itemprop="availability" content="{$product.availability_message}" />
                {/if}
                {if $settings.displayProductPriceBlock}
                    {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                    {hook h='displayProductPriceBlock' product=$product type='weight'}
                {/if}
            </div>
        {/if}
        {/block}

        {include file="catalog/_partials/miniatures/voucher.tpl"}

        {block name='product_buttons'}
        {if $settings.add_to_cart || $settings.view_more || $settings.displayProductListFunctionalButtons}
            <form type="post" action="{$cart_page_url}" class="product-item-buttons">
                {if $settings.add_to_cart}
                    <input type="hidden" name="token" value="{$static_token}">
                    <input type="hidden" name="id_product" value="{$product.id_product}">
                    <input type="hidden" name="qty" value="1">
                    <button data-button-action="add-to-cart" class="btn btn-primary">{l s='Add to cart' d='Shop.Theme.Actions'}</button>
                {/if}
                {if $settings.view_more}
                    <a href="{$product.url}" class="btn btn-tertiary-outline">{l s='More' d='Shop.Theme.Actions'}</a>
                {/if}
                {if !empty($settings.displayProductListFunctionalButtons)}
                    {hook h='displayProductListFunctionalButtons' product=$product}
                {/if}
            </form>
        {/if}
        {/block}

    </div>
    {/block}

    {block name='hook_reviews'}
    {if !empty($settings.displayProductListReviews)}
        {hook h='displayProductListReviews' product=$product hide_thumbnails=empty($settings.thumbnails)|intval}
    {/if}
    {/block}

    {block name='product_stickers'}
    {if $settings.stickers }
        <ul class="product-flags">
        {if $product.show_price && $product.has_discount && $product.discount_type === 'percentage'}
            <li class="discount-percentage">{$product.discount_percentage}</li>
        {/if}
        {foreach $product.flags as $flag}
            <li class="{$flag.type}">{$flag.label}</li>
        {/foreach}
        </ul>
    {/if}
    {/block}

</div>
</article>
{/block}

{* since 2.5.3 *}
