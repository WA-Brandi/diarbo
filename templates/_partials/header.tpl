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
    {block name='header_banner'}
    <div class="header-banner">
        {hook h='displayBanner'}
    </div>
    {/block}

    {block name='header_nav'}
    <nav class="header-nav">
        <div class="container">
            <div class="row header-nav-row">
                <div class="hn-left-block">
                    <div class="hn-lb-list">
                        <div class="hn-lb-l-single truck">
                            {* <a href="#" class="" title=""> *}
                                <p>
                                <img src="{$urls.theme_assets}svg/truck-green.svg" alt="" />
                                <span>{l s='Bezpłatna Wysyłka' d='Shop.Theme.Global'}</span>
                                </p>
                            {* </a> *}
                        </div>
                        <div class="hn-lb-l-single box">
                            {* <a href="#" class="" title=""> *}
                                <p>
                                <img src="{$urls.theme_assets}svg/box-green.svg" alt="" />
                                <span>{l s='Bezpłatne zwroty 30 dni' d='Shop.Theme.Global'}</span>
                                </p>
                            {* </a> *}
                        </div>
                        <div class="hn-lb-l-single percent">
                            <a href="{url entity='cms' id=1 id_lang=1}" class="" title="">
                                <img src="{$urls.theme_assets}svg/percent-green.svg" alt="" />
                                <span>{l s='DClub %' d='Shop.Theme.Global'}</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="right-nav-block">
                    <div class="right-nav">
                        {hook h='displayNav1'}
                        <div class="right-links">
                            <a href="{url entity='module-advanceblog-blog'}">
                                <span>{l s='Blog' d='Shop.Theme.Global'}</span>
                            </a>
                        </div>
                        {hook h='displayNav2'}
                    </div>
                </div>
            </div>
        </div>
    </nav>
    {/block}

    {block name='header_top'}
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 position-static">
                    <div class="col-md-2 {* hidden-sm-down *} desktop_logo" id="_desktop_logo">
                        {if $page.page_name == 'index'}
                        <h1>
                            <a href="{$urls.base_url}">
                                <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
                            </a>
                        </h1>
                        {else}
                        <a href="{$urls.base_url}">
                            <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
                        </a>
                        {/if}
                    </div>
                    {hook h='displayTop'}
                </div>
            </div>
            <div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
                <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
{*
                <div class="js-top-menu-bottom">
                    <div id="_mobile_currency_selector"></div>
                    <div id="_mobile_language_selector"></div>
                    <div id="_mobile_contact_link"></div>
                </div>
*}
            </div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    {hook h='displayNavFullWidth'}
                </div>
            </div>
        </div>
    </div>

    {/block}
