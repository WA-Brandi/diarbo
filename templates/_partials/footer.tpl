{**
* 2007-2019 PrestaShop and Contributors
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
* needs please refer to https://www.prestashop.com for more information.
*
* @author PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2019 PrestaShop SA and Contributors
* @license https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
    <div class="container">
        <div class="row">
            {block name='hook_footer_before'}
            {hook h='displayFooterBefore'}
            {/block}
        </div>
    </div>
    <div class="footer-container">
        <div class="container">
            <div class="row">
                {block name='hook_footer'}
                {hook h='displayFooter'}
                {/block}
            </div>
            <div class="row">
                {block name='hook_footer_after'}
                {hook h='displayFooterAfter'}
                {/block}
            </div>
            <div class="row">
                <div class="col-md-12 pay-del-block">
                    {if $language.id == '1'}
                        <img src="{$urls.theme_assets}img/img-pay-del.jpg" alt="Forol - {l s='Metody płatności' d='Shop.Theme.Global'}" />
                    {elseif $language.id == '2'}
                        <img src="{$urls.theme_assets}img/img-pay-del-de.jpg" alt="Forol - {l s='Metody płatności' d='Shop.Theme.Global'}" />
                    {else}
                        <img src="{$urls.theme_assets}img/img-pay-del.jpg" alt="Forol - {l s='Metody płatności' d='Shop.Theme.Global'}" />
                    {/if}
                </div>
                <div class="col-md-12 copy-dev-block">
                    <p class="copy">
                        {l s='%copyright% %year%, Diarbo.pl, Wszelkie prawa zastrzeżone.' sprintf=['%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
                    </p>
                    <p class="dev">
                        {l s='Projekt i realizacja: ' d='Shop.Theme.Global'}
                        <a href="https://psdes.eu" title="{l s='Sklepy internetowe Prestashop' d='Shop.Theme.Global'}">
                            {l s='PS Design' d='Shop.Theme.Global'}
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
