{**
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License 3.0 (AFL-3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
    <div id="_desktop_language_selector">
        <div class="language-selector-wrapper">
            {* <span id="language-selector-label" class="hidden-md-up">{l s='Language:' d='Shop.Theme.Global'}</span> *}
            <div class="language-selector dropdown js-dropdown">

{* Default
                <button data-toggle="dropdown" class="btn-unstyle" aria-haspopup="true" aria-expanded="false" aria-label="{l s='Language dropdown' d='Shop.Theme.Global'}">
                    <span class="expand-more"><img class="lang-flag" src="{$urls.img_lang_url}{$current_language.id_lang}.jpg" />{$current_language.name_simple}</span>
                    <i class="material-icons expand-more"></i>
                </button>
*}


                    {if isset($shopsGroup)}
                        {foreach from=$shopsGroup item=shop}
{if $shop.id_shop == $currentShop}
                <button data-toggle="dropdown" class="btn-unstyle {if $shop.id_shop == $currentShop}current{/if}" aria-haspopup="true" aria-expanded="false" aria-label="{l s='Language dropdown' d='Shop.Theme.Global'}">
                    <span class="expand-more">
                        <img class="lang-flag" src="/img/l/{$shop.lang.id_lang}.jpg" />
                        {$shop.lang.name}
                    </span>
                </button>
{/if}
                        {/foreach}
                    {/if}



                <ul class="dropdown-menu" aria-labelledby="language-selector-label">
{* Default
                    {foreach from=$languages item=language}
                        <li {if $language.id_lang==$current_language.id_lang} class="current" {/if}>
                            <a href="{url entity='language' id=$language.id_lang}" class="dropdown-item">
                                <img class="lang-flag" src="{$urls.img_lang_url}{$language.id_lang}.jpg" />
                                {$language.name_simple}
                            </a>
                        </li>
                    {/foreach}
*}
                    {if isset($shopsGroup)}
                        {foreach from=$shopsGroup item=shop}
                            {if $shop.theme_name == 'diarbo'}                                
                                <li class="{if $shop.id_shop == $currentShop}current{/if}">
                                    <a href="https://{$shop.domain}" class="dropdown-item">
                                    {if isset($shop.lang.id_lang)}
                                        <img src="/img/l/{$shop.lang.id_lang}.jpg" alt="{$shop.lang.language_code}" title="{$shop.lang.name}" />
                                        {$shop.lang.name}
                                    {else}
                                        <img src="/img/l/none.jpg" alt="Flag no found">
                                        {$shop.lang.name}
                                    {/if}
                                    </a>
                                </li>
                            {/if}
                        {/foreach}
                    {/if}


                </ul>

{* Default

                <select class="link hidden-md-up" aria-labelledby="language-selector-label">
                    {foreach from=$languages item=language}
                        <option value="{url entity='language' id=$language.id_lang}" {if $language.id_lang==$current_language.id_lang} selected="selected" {/if}>{$language.name_simple} </option>
                    {/foreach}
                </select>
*}

            </div>
        </div>
    </div>

{*
    <div id="mod-ps-languageselector">
        <h4>{l s='Language:' d='Shop.Theme.Global'}</h4>
        {if isset($shopsGroup)}
            {foreach from=$shopsGroup item=shop}
                <a href="https://{$shop.domain}" class="{if $shop.id_shop == $currentShop}active{/if}">
                {if isset($shop.lang.id_lang)}
                    <img src="/img/l/{$shop.lang.id_lang}.jpg" alt="{$shop.lang.language_code}" title="{$shop.lang.name}" />
                {else}
                    <img src="/img/l/none.jpg" alt="Flag no found">
                {/if}
                </a>
            {/foreach}
        {/if}
    </div>
*}
