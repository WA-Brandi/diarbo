{if isset($homeslider_slides) && $homeslider_slides}
    <div class="grid-cols-3">
        {foreach from=$homeslider_slides item=slide}
            {if $slide.active}
                <a class="ybc-nivo-link" href="{if $slide.url}{$slide.url|escape:'html':'UTF-8'}{else}#{/if}"
                    title="{$slide.title|escape:'htmlall':'UTF-8'}">
                    <img data-slide-id="{$slide.id_slide|escape:'html':'UTF-8'}"
                        src="{$link->getMediaLink("`$smarty.const._PS_IMG_`ybc_nivoslider/`$slide.image|escape:'htmlall':'UTF-8'`")}"
                        alt="{$slide.title|escape:'htmlall':'UTF-8'}" title="{$slide.title|escape:'htmlall':'UTF-8'}" />
                </a>
            {/if}
        {/foreach}
    </div>
{/if}