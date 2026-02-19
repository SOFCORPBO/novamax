-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2026 a las 19:03:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u316986534_novamax`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `account_details` text DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id`, `business_id`, `name`, `account_number`, `account_details`, `account_type_id`, `note`, `created_by`, `is_closed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'EFECTIVO BARS', '1', '[{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null}]', 1, NULL, 1, 0, NULL, '2025-08-26 16:05:40', '2025-10-10 19:51:41'),
(2, 1, 'EFECTIVO SPORT BARS', '2', '[{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null},{\"label\":null,\"value\":null}]', 1, NULL, 1, 0, NULL, '2025-10-10 19:52:06', '2025-10-10 19:52:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_detail_types`
--

CREATE TABLE `account_detail_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `account_subtype_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `account_detail_types`
--

INSERT INTO `account_detail_types` (`id`, `business_id`, `account_subtype_id`, `name`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Allowance for bad debts', 'Use Allowance for bad debts to estimate the part of Accounts Receivable that you think you might not collect. Use this only if you are keeping your books on the accrual basis.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(2, 0, 1, 'Assets available for sale', 'Use Assets available for sale to track assets that are available for sale that are not expected to be held for a long period of time.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(3, 0, 1, 'Development costs', 'Use Development costs to track amounts you deposit or set aside to arrange for financing, such as an SBA loan, or for deposits in anticipation of the purchase of property or other assets. When the deposit is refunded, or the purchase takes place, remove the amount from this account.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(4, 0, 1, 'Employee cash advances', 'Use Employee cash advances to track employee wages and salary you issue to an employee early, or other non-salary money given to employees. If you make a loan to an employee, use the Current asset account type called Loans to others, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(5, 0, 1, 'Inventory', 'Use Inventory to track the cost of goods your business purchases for resale. When the goods are sold, assign the sale to a Cost of sales account.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(6, 0, 1, 'Investments - Other', 'Use Investments - Other to track the value of investments not covered by other investment account types. Examples include publicly-traded shares, coins, or gold.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(7, 0, 1, 'Loans to officers', 'If you operate your business as a Corporation, use Loans to officers to track money loaned to officers of your business.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(8, 0, 1, 'Loans to others', 'Use Loans to others to track money your business loans to other people or businesses. This type of account is also referred to as Notes Receivable. For early salary payments to employees, use Employee cash advances, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(9, 0, 1, 'Loans to Shareholders', 'If you operate your business as a Corporation, use Loans to Shareholders to track money your business loans to its shareholders', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(10, 0, 1, 'Other current assets', 'Use Other current assets for current assets not covered by the other types. Current assets are likely to be converted to cash or used up in a year.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(11, 0, 1, 'Prepaid expenses', 'Use Prepaid expenses to track payments for expenses that you won\'t recognise until your next accounting period. When you recognise the expense, make a journal entry to transfer money from this account to the expense account.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(12, 0, 1, 'Retainage', 'Use Retainage if your customers regularly hold back a portion of a contract amount until you have completed a project. This type of account is often used in the construction industry, and only if you record income on an accrual basis.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(13, 0, 1, 'Undeposited funds', 'Use Undeposited funds for cash or cheques from sales that haven\'t been deposited yet. For petty cash, use Cash on hand, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(14, 0, 2, 'Accumulated amortisation of non-current assets', 'Use Accumulated amortisation of non-current assets to track how much you\'ve amortised an asset whose type is Non-Current Asset.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(15, 0, 2, 'Assets held for sale', 'Use Assets held for sale to track assets of a company that are available for sale that are not expected to be held for a long period of time.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(16, 0, 2, 'Deferred tax', 'Use Deferred tax for tax liabilities or assets that are to be used in future accounting periods.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(17, 0, 2, 'Goodwill', 'Use Goodwill only if you have acquired another company. It represents the intangible assets of the acquired company which gave it an advantage, such as favourable government relations, business name, outstanding credit ratings, location, superior management, customer lists, product quality, or good labour relations.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(18, 0, 2, 'Intangible assets', 'Use Intangible assets to track intangible assets that you plan to amortise. Examples include franchises, customer lists, copyrights, and patents.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(19, 0, 2, 'Lease buyout', 'Use Lease buyout to track lease payments to be applied toward the purchase of a leased asset. You don\'t track the leased asset itself until you purchase it.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(20, 0, 2, 'Licences', 'Use Licences to track non-professional licences for permission to engage in an activity, like selling alcohol or radio broadcasting. For fees associated with professional licences granted to individuals, use a Legal and professional fees expense account, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(21, 0, 2, 'Long-term investments', 'Use Long-term investments to track investments that have a maturity date of longer than one year.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(22, 0, 2, 'Organisational costs', 'Use Organisational costs to track costs incurred when forming a partnership or corporation. The costs include the legal and accounting costs necessary to organise the company, facilitate the filings of the legal documents, and other paperwork.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(23, 0, 2, 'Other non-current assets', 'Use Other non-current assets to track assets not covered by other types. Non-current assets are long-term assets that are expected to provide value for more than one year.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(24, 0, 2, 'Security deposits', 'Use Security deposits to track funds you\'ve paid to cover any potential costs incurred by damage, loss, or theft. The funds should be returned to you at the end of the contract. If you accept down payments, advance payments, security deposits, or other kinds of deposits, use an Other Current liabilities account with the detail type Other Current liabilities.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(25, 0, 3, 'Accumulated depletion', 'Use Accumulated depletion to track how much you deplete a natural resource.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(26, 0, 3, 'Accumulated depreciation on property, plant and equipment', 'Use Accumulated depreciation on property, plant and equipment to track how much you depreciate a fixed asset (a physical asset you do not expect to convert to cash during one year of normal operations).', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(27, 0, 3, 'Buildings', 'Use Buildings to track the cost of structures you own and use for your business. If you have a business in your home, consult your accountant. Use a Land account for the land portion of any real property you own, splitting the cost of the property between land and building in a logical method. A common method is to mimic the land-to-building ratio on the property tax statement.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(28, 0, 3, 'Depletable assets', 'Use Depletable assets to track natural resources, such as timberlands, oil wells, and mineral deposits.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(29, 0, 3, 'Furniture and fixtures', 'Use Furniture and fixtures to track any furniture and fixtures your business owns and uses, like a dental chair or sales booth.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(30, 0, 3, 'Land', 'Use Land to track assets that are not easily convertible to cash or not expected to become cash within the next year. For example, leasehold improvements.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(31, 0, 3, 'Leasehold improvements', 'Use Leasehold improvements to track improvements to a leased asset that increases the asset\'s value. For example, if you carpet a leased office space and are not reimbursed, that\'s a leasehold improvement.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(32, 0, 3, 'Machinery and equipment', 'Use Machinery and equipment to track computer hardware, as well as any other non-furniture fixtures or devices owned and used for your business. This includes equipment that you ride, like tractors and lawn mowers. Cars and lorries, however, should be tracked with Vehicle accounts, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(33, 0, 3, 'Other fixed asset', 'Use Other fixed asset for fixed assets that are not covered by other asset types. Fixed assets are physical property that you use in your business and that you do not expect to convert to cash or be used up during one year of normal operations.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(34, 0, 3, 'Vehicles', 'Use Vehicles to track the value of vehicles your business owns and uses for business. This includes off-road vehicles, air planes, helicopters, and boats. If you use a vehicle for both business and personal use, consult your accountant to see how you should track its value.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(35, 0, 4, 'Accounts Receivable(A/R)', 'Accounts receivable (also called A/R, Debtors, or Trade and other receivables) tracks money that customers owe you for products or services, and payments customers make. Ultimate Pos -Accounting Module  automatically creates one Accounts receivable account for you. Most businesses need only one. Each customer has a register, which functions like an Accounts receivable account for each customer.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(36, 0, 5, 'Bank', 'Use Bank accounts to track all your current activity, including debit card transactions. Each current account your company has at a bank or other financial institution should have its own Bank type account in Ultimate POS.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(37, 0, 5, 'Cash and Cash Equivalents', 'Use Cash and Cash Equivalents to track cash or assets that can be converted into cash immediately. For example, marketable securities and Treasury bills.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(38, 0, 5, 'Cash on hand', 'Use a Cash on hand account to track cash your company keeps for occasional expenses, also called petty cash. To track cash from sales that have not been deposited yet, use a pre-created account called Undeposited funds, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(39, 0, 5, 'Client trust accounts', 'Use Client trust accounts for money held by you for the benefit of someone else. For example, trust accounts are often used by attorneys to keep track of expense money their customers have given them. Often, to keep the amount in a trust account from looking like it\'s yours, the amount is offset in a \"contra\" liability account (a Current Liability).', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(40, 0, 5, 'Money market', 'Use Money market to track amounts in money market accounts. For investments, see Current Assets, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(41, 0, 5, 'Rents held in trust', 'Use Rents held in trust to track deposits and rent held on behalf of the property owners. Typically only property managers use this type of account.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(42, 0, 5, 'Savings', 'Use Savings accounts to track your savings and CD activity. Each savings account your company has at a bank or other financial institution should have its own Savings type account. For investments, see Current Assets, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(43, 0, 6, 'Accrued Liabilities', 'Use Accrued Liabilities to track expenses that a business has incurred but has not yet paid. For example, pensions for companies that contribute to a pension fund for their employees for their retirement.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(44, 0, 6, 'Client Trust accounts - liabilities', 'Use Client Trust accounts - liabilities to offset Client Trust accounts in assets. Amounts in these accounts are held by your business on behalf of others. They do not belong to your business, so should not appear to be yours on your balance sheet. This \"contra\" account takes care of that, as long as the two balances match.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(45, 0, 6, 'Current tax liability', 'Use Current tax liability to track the total amount of taxes collected but not yet paid to the government.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(46, 0, 6, 'Current portion of obligations under finance leases', 'Use Current portion of obligations under finance leases to track the value of lease payments due within the next 12 months.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(47, 0, 6, 'Dividends payable', 'Use Dividends payable to track dividends that are owed to shareholders but have not yet been paid.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(48, 0, 6, 'Income tax payable', 'Use Income tax payable to track monies that are due to pay the company\'s income tax liabilties.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(49, 0, 6, 'Insurance payable', 'Use Insurance payable to keep track of insurance amounts due. This account is most useful for businesses with monthly recurring insurance expenses.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(50, 0, 6, 'Line of credit', 'Use Line of credit to track the balance due on any lines of credit your business has. Each line of credit your business has should have its own Line of credit account.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(51, 0, 6, 'Loan payable', 'Use Loan payable to track loans your business owes which are payable within the next twelve months. For longer-term loans, use the Long-term liability called Notes payable, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(52, 0, 6, 'Other current liabilities', 'Use Other current liabilities to track monies owed by the company and due within one year.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(53, 0, 6, 'Payroll clearing', 'Use Payroll clearing to keep track of any non-tax amounts that you have deducted from employee paycheques or that you owe as a result of doing payroll. When you forward money to the appropriate suppliers, deduct the amount from the balance of this account. Do not use this account for tax amounts you have withheld or owe from paying employee wages. For those amounts, use the Payroll tax payable account instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(54, 0, 6, 'Payroll liabilities', 'Use Payroll liabilities to keep track of tax amounts that you owe to government agencies as a result of paying wages. This includes taxes withheld, health care premiums, employment insurance, government pensions, etc. When you forward the money to the government agency, deduct the amount from the balance of this account.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(55, 0, 6, 'Prepaid expenses payable', 'Use Prepaid expenses payable to track items such as property taxes that are due, but not yet deductible as an expense because the period they cover has not yet passed.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(56, 0, 6, 'Rents in trust - Liability', 'Use Rents in trust - liability to offset the Rents in trust amount in assets. Amounts in these accounts are held by your business on behalf of others. They do not belong to your business, so should not appear to be yours on your balance sheet. This \"contra\" account takes care of that, as long as the two balances match.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(57, 0, 6, 'Sales and service tax payable', 'Use Sales and service tax payable to track tax you have collected, but not yet remitted to your government tax agency. This includes value-added tax, goods and services tax, sales tax, and other consumption tax.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(58, 0, 7, 'Accrued holiday payable', 'Use Accrued holiday payable to track holiday earned but that has not been paid out to employees.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(59, 0, 7, 'Accrued Non-current liabilities', 'Use Accrued Non-current liabilities to track expenses that a business has incurred but has not yet paid. For example, pensions for companies that contribute to a pension fund for their employees for their retirement.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(60, 0, 7, 'Liabilities related to assets held for sale', 'Use Liabilities related to assets held for sale to track any liabilities that are directly related to assets being sold or written off.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(61, 0, 7, 'Long-term debt', 'Use Long-term debt to track loans and obligations with a maturity of longer than one year. For example, mortgages.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(62, 0, 7, 'Notes payable', 'Use Notes payable to track the amounts your business owes in long-term (over twelve months) loans. For shorter loans, use the Current liability account type called Loan payable, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(63, 0, 7, 'Other non-current liabilities', 'Use Other non-current liabilities to track liabilities due in more than twelve months that don\'t fit the other Non-Current liability account types.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(64, 0, 7, 'Shareholder notes payable', 'Use Shareholder notes payable to track long-term loan balances your business owes its shareholders.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(65, 0, 8, 'Accounts Payable (A/P)', 'Accounts payable (also called A/P, Trade and other payables, or Creditors) tracks amounts you owe to your suppliers. Ultimate POS automatically creates one Accounts Payable account for you. Most businesses need only one.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(66, 0, 9, 'Credit Card', 'Credit card accounts track the balance due on your business credit cards. Create one Credit card account for each credit card account your business uses.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(67, 0, 10, 'Accumulated Adjustment', 'Some corporations use this account to track adjustments to owner\'s equity that are not attributable to net income.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(68, 0, 10, 'Dividend disbursed', 'Use Dividend disbursed to track a payment given to its shareholders out of the company\'s retained earnings.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(69, 0, 10, 'Equity in earnings of subsidiaries', 'Use Equity in earnings of subsidiaries to track the original investment in shares of subsidiaries plus the share of earnings or losses from the operations of the subsidiary.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(70, 0, 10, 'Opening balance equity', 'Ultimate POS creates this account the first time you enter an opening balance for a balance sheet account. As you enter opening balances, Ultimate POS records the amounts in Opening balance equity. This ensures that you have a correct balance sheet for your company, even before you\'ve finished entering all your company\'s assets and liabilities.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(71, 0, 10, 'Ordinary shares', 'Corporations use Ordinary shares to track its ordinary shares in the hands of shareholders. The amount in this account should be the stated (or par) value of the stock.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(72, 0, 10, 'Other comprehensive income', 'Use Other comprehensive income to track the increases or decreases in income from various businesses that is not yet absorbed by the company.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(73, 0, 10, 'Owner\'s Equity', 'Corporations use Owner\'s equity to show the cumulative net income or loss of their business as of the beginning of the financial year.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(74, 0, 10, 'Paid-in capital or Surplus', 'Corporations use Paid-in capital to track amounts received from shareholders in exchange for shares that are over and above the shares\' stated (or par) value.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(75, 0, 10, 'Partner contributions', 'Partnerships use Partner contributions to track amounts partners contribute to the partnership during the year.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(76, 0, 10, 'Partner distributions', 'Partnerships use Partner distributions to track amounts distributed by the partnership to its partners during the year. Don\'t use this for regular payments to partners for interest or service. For regular payments, use a Guaranteed payments account (a Expense account in Payroll expenses), instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(77, 0, 10, 'Partner\'s Equity', 'Partnerships use Partner\'s equity to show the income remaining in the partnership for each partner as of the end of the prior year.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(78, 0, 10, 'Preferred Shares', 'Corporations use this account to track its preferred shares in the hands of shareholders. The amount in this account should be the stated (or par) value of the shares.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(79, 0, 10, 'Retained earnings', 'Ultimate POS adds this account when you create your company. Retained earnings tracks net income from previous financial years. Ultimate POS automatically transfers your profit (or loss) to Retained earnings at the end of each financial year.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(80, 0, 10, 'Share capital', 'Use Share capital to track the funds raised by issuing shares.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(81, 0, 10, 'Treasury shares', 'Corporations use Treasury shares to track amounts paid by the corporation to buy its own shares back from shareholders.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(82, 0, 11, 'Discounts/refunds given', 'Use Discounts/refunds given to track discounts you give to customers. This account typically has a negative balance so it offsets other income. For discounts from suppliers, use an expense account, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(83, 0, 11, 'Non-profit income', 'Use Non-profit income to track money coming in if you are a non-profit organisation.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(84, 0, 11, 'Other primary income', 'Use Other primary income to track income from normal business operations that doesn\'t fall into another Income type.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(85, 0, 11, 'Revenue - General', 'Use Revenue - General to track income from normal business operations that do not fit under any other category.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(86, 0, 11, 'Sales - retail', 'Use Sales - retail to track sales of goods/services that have a mark-up cost to consumers.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(87, 0, 11, 'Sales - wholesale', 'Use Sales - wholesale to track the sale of goods in quantity for resale purposes.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(88, 0, 11, 'Sales of Product Income', 'Use Sales of product income to track income from selling products. This can include all kinds of products, like crops and livestock, rental fees, performances, and food served.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(89, 0, 11, 'Service/fee income', 'Use Service/fee income to track income from services you perform or ordinary usage fees you charge. For fees customers pay you for late payments or other uncommon situations, use an Other Income account type called Other miscellaneous income, instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(90, 0, 11, 'Unapplied Cash Payment Income', 'Unapplied Cash Payment Income reports the Cash Basis income from customers payments you\'ve received but not applied to invoices or charges. In general, you would never use this directly on a purchase or sale transaction.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(91, 0, 12, 'Dividend income', 'Use Dividend income to track taxable dividends from investments.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(92, 0, 12, 'Interest earned', 'Use Interest earned to track interest from bank or savings accounts, investments, or interest payments to you on loans your business made.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(93, 0, 12, 'Loss on disposal of assets', 'Use Loss on disposal of assets to track losses realised on the disposal of assets.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(94, 0, 12, 'Other investment income', 'Use Other investment income to track other types of investment income that isn\'t from dividends or interest.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(95, 0, 12, 'Other miscellaneous income', 'Use Other miscellaneous income to track income that isn\'t from normal business operations, and doesn\'t fall into another Other Income type.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(96, 0, 12, 'Other operating income', 'Use Other operating income to track income from activities other than normal business operations. For example, Investment interest, foreign exchange gains, and rent income.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(97, 0, 12, 'Tax-exempt interest', 'Use Tax-exempt interest to record interest that isn\'t taxable, such as interest on money in tax-exempt retirement accounts, or interest from tax-exempt bonds.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(98, 0, 12, 'Unrealised loss on securities, net of tax', 'Use Unrealised loss on securities, net of tax to track losses on securities that have occurred but are yet been realised through a transaction. For example, shares whose value has fallen but that are still being held.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(99, 0, 13, 'Advertising/Promotional', 'Use Advertising/promotional to track money spent promoting your company. You may want different accounts of this type to track different promotional efforts (Yellow Pages, newspaper, radio, flyers, events, and so on). If the promotion effort is a meal, use Promotional meals instead.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(100, 0, 13, 'Amortisation Expense', 'Use Amortisation expense to track writing off of assets (such as intangible assets or investments) over the projected life of the assets.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(101, 0, 13, 'Auto', 'Use Auto to track costs associated with vehicles. You may want different accounts of this type to track petrol, repairs, and maintenance. If your business owns a car or lorry, you may want to track its value as a Fixed Asset, in addition to tracking its expenses.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(102, 0, 13, 'Bad debt', 'Use Bad debt to track debt you have written off.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(103, 0, 13, 'Bank charges', 'Use Bank charges for any fees you pay to financial institutions.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(104, 0, 13, 'Charitable contributions', 'Use Charitable contributions to track gifts to charity.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(105, 0, 13, 'Commissions and fees', 'Use Commissions and fees to track amounts paid to agents (such as brokers) in order for them to execute a trade.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(106, 0, 13, 'Cost of labour', 'Use Cost of labour to track the cost of paying employees to produce products or supply services. It includes all employment costs, including food and transportation, if applicable. This account is also available as a Cost of Sales (COS) account.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(107, 0, 13, 'Dues and subscriptions', 'Use Dues and subscriptions to track dues and subscriptions related to running your business. You may want different accounts of this type for professional dues, fees for licences that can\'t be transferred, magazines, newspapers, industry publications, or service subscriptions.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(108, 0, 13, 'Equipment rental', 'Use Equipment rental to track the cost of renting equipment to produce products or services. This account is also available as a Cost of Sales account. If you purchase equipment, use a Fixed asset account type called Machinery and equipment.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(109, 0, 13, 'Finance costs', 'Use Finance costs to track the costs of obtaining loans or credit. Examples of finance costs would be credit card fees, interest and mortgage costs.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(110, 0, 13, 'Income tax expense', 'Use Income tax expense to track income taxes that the company has paid to meet their tax obligations.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(111, 0, 13, 'Insurance', 'Use Insurance to track insurance payments. You may want different accounts of this type for different types of insurance (auto, general liability, and so on).', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(112, 0, 13, 'Interest paid', 'Use Interest paid for all types of interest you pay, including mortgage interest, finance charges on credit cards, or interest on loans.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(113, 0, 13, 'Legal and professional fees', 'Use Legal and professional fees to track money to pay to professionals to help you run your business. You may want different accounts of this type for payments to your accountant, attorney, or other consultants.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(114, 0, 13, 'Loss on discontinued operations, net of tax', 'Use Loss on discontinued operations, net of tax to track the loss realised when a part of the business ceases to operate or when a product line is discontinued.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(115, 0, 13, 'Management compensation', 'Use Management compensation to track remuneration paid to Management, Executives and non-Executives. For example, salary, fees, and benefits.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(116, 0, 13, 'Meals and entertainment', 'Use Meals and entertainment to track how much you spend on dining with your employees to promote morale. If you dine with a customer to promote your business, use a Promotional meals account, instead. Be sure to include who you ate with and the purpose of the meal when you enter the transaction.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(117, 0, 13, 'Office/general administrative expenses', 'Use Office/general administrative expenses to track all types of general or office-related expenses.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(118, 0, 13, 'Other miscellaneous service cost', 'Use Other miscellaneous service cost to track costs related to providing services that don\'t fall into another Expense type. This account is also available as a Cost of Sales (COS) account.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(119, 0, 13, 'Other selling expenses', 'Use Other selling expenses to track selling expenses incurred that do not fall under any other category.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(120, 0, 13, 'Payroll expenses', 'Use Payroll expenses to track payroll expenses. You may want different accounts of this type for things like: Compensation of officers, Guaranteed payments, Workers compensation, Salaries and wages, Payroll taxes', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(121, 0, 13, 'Rent or lease of buildings', 'Use Rent or lease of buildings to track rent payments you make.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(122, 0, 13, 'Repair and maintenance', 'Use Repair and maintenance to track any repairs and periodic maintenance fees. You may want different accounts of this type to track different types repair & maintenance expenses (auto, equipment, landscape, and so on).', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(123, 0, 13, 'Shipping and delivery expense', 'Use Shipping and delivery expense to track the cost of shipping and delivery of goods to customers.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(124, 0, 13, 'Supplies & materials', 'Use Supplies & materials to track the cost of raw goods and parts used or consumed when producing a product or providing a service. This account is also available as a Cost of Sales account.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(125, 0, 13, 'Taxes paid', 'Use Taxes paid to track taxes you pay. You may want different accounts of this type for payments to different tax agencies.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(126, 0, 13, 'Travel expenses - general and admin expenses', 'Use Travel expenses - general and admin expenses to track travelling costs incurred that are not directly related to the revenue-generating operation of the company. For example, flight tickets and hotel costs when performing job interviews.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(127, 0, 13, 'Travel expenses - selling expense', 'Use Travel expenses - selling expense to track travelling costs incurred that are directly related to the revenue-generating operation of the company. For example, flight tickets and hotel costs when selling products and services.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(128, 0, 13, 'Unapplied Cash Bill Payment Expense', 'Unapplied Cash Bill Payment Expense reports the Cash Basis expense from supplier payment cheques you\'ve sent but not yet applied to supplier bills. In general, you would never use this directly on a purchase or sale transaction.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(129, 0, 13, 'Utilities', 'Use Utilities to track utility payments. You may want different accounts of this type to track different types of utility payments (gas and electric, telephone, water, and so on).', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(130, 0, 14, 'Cost of labour - COS', 'Use Cost of labour - COS to track the cost of paying employees to produce products or supply services. It includes all employment costs, including food and transportation, if applicable.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(131, 0, 14, 'Equipment rental - COS', 'Use Equipment rental - COS to track the cost of renting equipment to produce products or services. If you purchase equipment, use a Fixed Asset account type called Machinery and equipment.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(132, 0, 14, 'Freight and delivery - COS', 'Use Freight and delivery - COS to track the cost of shipping/delivery of obtaining raw materials and producing finished goods for resale.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(133, 0, 14, 'Other costs of sales - COS', 'Use Other costs of sales - COS to track costs related to services or sales that you provide that don\'t fall into another Cost of Sales type.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(134, 0, 14, 'Supplies and materials - COS', 'Use Supplies and materials - COS to track the cost of raw goods and parts used or consumed when producing a product or providing a service.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(135, 0, 15, 'Amortisation', 'Use Amortisation to track amortisation of intangible assets. Amortisation is spreading the cost of an intangible asset over its useful life, like depreciation of fixed assets. You may want an amortisation account for each intangible asset you have.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(136, 0, 15, 'Depreciation', 'Use Depreciation to track how much you depreciate fixed assets. You may want a depreciation account for each fixed asset you have.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(137, 0, 15, 'Exchange Gain or Loss', 'Use Exchange Gain or Loss to track gains or losses that occur as a result of exchange rate fluctuations.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(138, 0, 15, 'Other expense', 'Use Other expense to track unusual or infrequent expenses that don\'t fall into another Other Expense type.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(139, 0, 15, 'Penalties and settlements', 'Use Penalties and settlements to track money you pay for violating laws or regulations, settling lawsuits, or other penalties.', 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_subtypes`
--

CREATE TABLE `account_subtypes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `account_type` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `account_subtypes`
--

INSERT INTO `account_subtypes` (`id`, `business_id`, `account_type`, `name`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 0, 'asset', 'Current Assets', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(2, 0, 'asset', 'Non- Current Assets', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(3, 0, 'asset', 'Fixed Assets', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(4, 0, 'asset', 'Accounts Receivable(A/R)', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(5, 0, 'asset', 'Cash and Cash Equivalents (CCE)', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(6, 0, 'liability', 'Current Liabilities', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(7, 0, 'liability', 'Non- Current Liabilities', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(8, 0, 'liability', 'Accounts Payable (A/P)', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(9, 0, 'liability', 'Credit Card', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(10, 0, 'equity', 'Owner\'s Equity', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(11, 0, 'income', 'Income', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(12, 0, 'income', 'Other Income', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(13, 0, 'expense', 'Expense', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(14, 0, 'expense', 'Cost of Sales', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00'),
(15, 0, 'expense', 'Other Expense', NULL, 1, '2025-08-26 16:53:00', '2025-08-26 16:53:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `account_id`, `type`, `sub_type`, `amount`, `reff_no`, `operation_date`, `created_by`, `transaction_id`, `transaction_payment_id`, `transfer_transaction_id`, `note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(0, 2, 'credit', NULL, 3010.5000, NULL, '2026-02-17 15:16:57', 1, NULL, 43, NULL, NULL, '2026-02-17 19:26:42', '2026-02-17 19:16:57', '2026-02-17 19:26:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `account_types`
--

INSERT INTO `account_types` (`id`, `name`, `parent_account_type_id`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'EFECTIVO', NULL, 1, '2025-08-26 16:05:15', '2025-08-26 16:05:15'),
(2, 'BANCOS', NULL, 1, '2025-10-10 19:51:04', '2025-10-10 19:51:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `business_id`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 18:21:36', '2026-02-17 18:21:36'),
(2, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 18:21:38', '2026-02-17 18:21:38'),
(3, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 18:21:42', '2026-02-17 18:21:42'),
(4, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:05:15', '2026-02-17 19:05:15'),
(5, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:05:17', '2026-02-17 19:05:17'),
(6, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20}}', NULL, '2026-02-17 19:06:50', '2026-02-17 19:06:50'),
(7, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:11:56', '2026-02-17 19:11:57'),
(8, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:12:01', '2026-02-17 19:12:01'),
(9, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20}}', NULL, '2026-02-17 19:12:26', '2026-02-17 19:12:26'),
(10, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3000}}', NULL, '2026-02-17 19:14:08', '2026-02-17 19:14:08'),
(11, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3000}}', NULL, '2026-02-17 19:16:40', '2026-02-17 19:16:40'),
(12, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3010.5}}', NULL, '2026-02-17 19:16:58', '2026-02-17 19:16:58'),
(13, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:26:43', '2026-02-17 19:26:43'),
(14, 'default', 'added', 8, 'App\\Contact', NULL, 1, 1, 'App\\User', '[]', NULL, '2026-02-17 19:28:42', '2026-02-17 19:28:42'),
(15, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-17 19:28:54', '2026-02-17 19:28:54'),
(16, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:31:01', '2026-02-17 19:31:01'),
(17, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:34:13', '2026-02-17 19:34:13'),
(18, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:37:07', '2026-02-17 19:37:07'),
(19, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:38:20', '2026-02-17 19:38:20'),
(20, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:38:27', '2026-02-17 19:38:27'),
(21, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:38:34', '2026-02-17 19:38:34'),
(22, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:40:00', '2026-02-17 19:40:00'),
(23, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:41:54', '2026-02-17 19:41:54'),
(24, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:48:17', '2026-02-17 19:48:17'),
(25, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:50:01', '2026-02-17 19:50:01'),
(26, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 19:51:50', '2026-02-17 19:51:50'),
(27, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3000}}', NULL, '2026-02-17 19:52:00', '2026-02-17 19:52:00'),
(28, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3000}}', NULL, '2026-02-17 19:52:49', '2026-02-17 19:52:49'),
(29, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 20:41:04', '2026-02-17 20:41:04'),
(30, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 20:41:14', '2026-02-17 20:41:14'),
(31, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 20:42:06', '2026-02-17 20:42:06'),
(32, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 20:42:10', '2026-02-17 20:42:10'),
(33, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 20:46:14', '2026-02-17 20:46:14'),
(34, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 20:48:03', '2026-02-17 20:48:03'),
(35, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 20:54:00', '2026-02-17 20:54:00'),
(36, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 20:54:20', '2026-02-17 20:54:20'),
(37, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:01:28', '2026-02-17 21:01:28'),
(38, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:01:50', '2026-02-17 21:01:50'),
(39, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:05:39', '2026-02-17 21:05:39'),
(40, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:34:57', '2026-02-17 21:34:57'),
(41, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:35:03', '2026-02-17 21:35:03'),
(42, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:35:09', '2026-02-17 21:35:09'),
(43, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:39:54', '2026-02-17 21:39:54'),
(44, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:39:58', '2026-02-17 21:39:58'),
(45, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:40:02', '2026-02-17 21:40:02'),
(46, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:40:07', '2026-02-17 21:40:07'),
(47, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:57:43', '2026-02-17 21:57:43'),
(48, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 21:59:50', '2026-02-17 21:59:50'),
(49, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 22:08:20', '2026-02-17 22:08:20'),
(50, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3512.25}}', NULL, '2026-02-17 22:12:54', '2026-02-17 22:12:54'),
(51, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3500}}', NULL, '2026-02-17 22:24:24', '2026-02-17 22:24:24'),
(52, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2026-02-17 23:20:59', '2026-02-17 23:20:59'),
(53, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-17 23:25:48', '2026-02-17 23:25:48'),
(54, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-17 23:26:05', '2026-02-17 23:26:05'),
(55, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-17 23:26:12', '2026-02-17 23:26:12'),
(56, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-17 23:26:31', '2026-02-17 23:26:31'),
(57, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-17 23:27:57', '2026-02-17 23:27:57'),
(58, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-17 23:28:01', '2026-02-17 23:28:01'),
(59, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-17 23:31:29', '2026-02-17 23:31:29'),
(60, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2026-02-18 17:04:05', '2026-02-18 17:04:08'),
(61, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-18 17:07:16', '2026-02-18 17:07:16'),
(62, 'default', 'added', 0, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0.23}}', NULL, '2026-02-18 17:09:50', '2026-02-18 17:09:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assets`
--

CREATE TABLE `assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `asset_code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `model` varchar(191) DEFAULT NULL,
  `serial_no` varchar(191) DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_type` varchar(191) DEFAULT NULL,
  `unit_price` decimal(22,4) NOT NULL,
  `depreciation` decimal(22,4) DEFAULT NULL,
  `is_allocatable` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `assets`
--

INSERT INTO `assets` (`id`, `business_id`, `asset_code`, `name`, `quantity`, `model`, `serial_no`, `category_id`, `location_id`, `purchase_date`, `purchase_type`, `unit_price`, `depreciation`, `is_allocatable`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 'ESCRITORIO', 1.0000, 'Escritorio Gerencial de madera', '544', 3, 1, '2024-10-21', 'owned', 10000.0000, 10.0000, 1, 'Escritorio asignado a Gerencia', 1, '2025-08-28 09:20:52', '2025-08-28 09:20:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asset_maintenances`
--

CREATE TABLE `asset_maintenances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `maitenance_id` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `priority` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `maintenance_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asset_maintenances`
--

INSERT INTO `asset_maintenances` (`id`, `business_id`, `asset_id`, `maitenance_id`, `status`, `priority`, `created_by`, `assigned_to`, `details`, `maintenance_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025/0001', 'new', 'medium', 1, NULL, NULL, 'necesita barniz', '2025-08-28 09:27:12', '2025-08-28 09:27:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asset_transactions`
--

CREATE TABLE `asset_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_type` varchar(191) NOT NULL,
  `ref_no` varchar(191) NOT NULL,
  `receiver` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from users table, who receives asset',
  `quantity` decimal(22,4) NOT NULL,
  `transaction_datetime` datetime NOT NULL,
  `allocated_upto` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from asset_transactions table',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'id from users table, who allocated asset',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asset_transactions`
--

INSERT INTO `asset_transactions` (`id`, `business_id`, `asset_id`, `transaction_type`, `ref_no`, `receiver`, `quantity`, `transaction_datetime`, `allocated_upto`, `reason`, `parent_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'allocate', '2025/0001', 2, 1.0000, '2025-08-20 09:22:00', NULL, 'para que use', NULL, 1, '2025-08-28 09:22:39', '2025-08-28 09:22:39'),
(2, 1, 1, 'revoke', '2025/0001', NULL, 1.0000, '2025-08-28 09:25:00', NULL, 'aahgashjgdas', 1, 1, '2025-08-28 09:25:34', '2025-08-28 09:25:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asset_warranties`
--

CREATE TABLE `asset_warranties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `additional_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 06:13:44', '2017-12-18 06:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 06:04:39', '2017-12-18 06:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 05:55:40', '2017-12-18 05:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 05:58:40', '2017-12-18 05:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) NOT NULL,
  `booking_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branch_capital`
--

CREATE TABLE `branch_capital` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `debit` decimal(11,2) DEFAULT NULL,
  `credit` decimal(11,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'VARIOS', NULL, 1, NULL, '2025-08-26 16:02:37', '2025-08-26 16:02:37'),
(2, 1, 'AQUARIUS', NULL, 1, NULL, '2025-09-25 16:27:33', '2025-09-25 16:27:33'),
(3, 1, 'BARS', NULL, 1, NULL, '2025-09-25 16:27:42', '2025-09-25 16:27:42'),
(4, 1, 'COCA COLA', NULL, 1, NULL, '2025-09-25 16:27:54', '2025-09-25 16:27:54'),
(5, 1, 'DEL VALLE', NULL, 1, NULL, '2025-09-25 16:28:09', '2025-09-25 16:28:09'),
(6, 1, 'FANTA', NULL, 1, NULL, '2025-09-25 16:28:19', '2025-09-25 16:28:19'),
(7, 1, 'SPRITE', NULL, 1, NULL, '2025-09-25 16:28:29', '2025-09-25 16:28:29'),
(8, 1, '7OP', NULL, 1, NULL, '2025-09-25 16:36:50', '2025-09-25 16:36:50'),
(9, 1, 'BUDWEISER', NULL, 1, NULL, '2025-09-25 16:38:08', '2025-09-25 16:38:08'),
(10, 1, 'HUARI', NULL, 1, NULL, '2025-09-25 16:38:36', '2025-09-25 16:38:36'),
(11, 1, 'PACEÑA', NULL, 1, NULL, '2025-09-25 16:38:59', '2025-09-25 16:38:59'),
(12, 1, 'PEPSI', NULL, 1, NULL, '2025-09-25 16:40:05', '2025-09-25 16:40:05'),
(13, 1, '7UP', NULL, 1, NULL, '2025-09-25 16:52:36', '2025-09-25 16:52:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `budgets`
--

CREATE TABLE `budgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED NOT NULL,
  `financial_year` varchar(191) NOT NULL,
  `month_1` double(8,2) NOT NULL,
  `month_2` double(8,2) NOT NULL,
  `month_3` double(8,2) NOT NULL,
  `month_4` double(8,2) NOT NULL,
  `month_5` double(8,2) NOT NULL,
  `month_6` double(8,2) NOT NULL,
  `month_7` double(8,2) NOT NULL,
  `month_8` double(8,2) NOT NULL,
  `month_9` double(8,2) NOT NULL,
  `month_10` double(8,2) NOT NULL,
  `month_11` double(8,2) NOT NULL,
  `month_12` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) DEFAULT NULL,
  `tax_label_1` varchar(10) DEFAULT NULL,
  `tax_number_2` varchar(100) DEFAULT NULL,
  `tax_label_2` varchar(10) DEFAULT NULL,
  `code_label_1` varchar(191) DEFAULT NULL,
  `code_1` varchar(191) DEFAULT NULL,
  `code_label_2` varchar(191) DEFAULT NULL,
  `code_2` varchar(191) DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') NOT NULL DEFAULT 'includes',
  `logo` varchar(191) DEFAULT NULL,
  `sku_prefix` varchar(191) DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text DEFAULT NULL,
  `pos_settings` text DEFAULT NULL,
  `woocommerce_api_settings` text DEFAULT NULL,
  `woocommerce_skipped_orders` text DEFAULT NULL,
  `woocommerce_wh_oc_secret` varchar(191) DEFAULT NULL,
  `woocommerce_wh_ou_secret` varchar(191) DEFAULT NULL,
  `woocommerce_wh_od_secret` varchar(191) DEFAULT NULL,
  `woocommerce_wh_or_secret` varchar(191) DEFAULT NULL,
  `essentials_settings` longtext DEFAULT NULL,
  `weighing_scale_setting` text NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') NOT NULL DEFAULT 'before',
  `enabled_modules` text DEFAULT NULL,
  `date_format` varchar(191) NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') NOT NULL DEFAULT '24',
  `currency_precision` tinyint(4) NOT NULL DEFAULT 2,
  `quantity_precision` tinyint(4) NOT NULL DEFAULT 2,
  `ref_no_prefixes` text DEFAULT NULL,
  `theme_color` char(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `asset_settings` text DEFAULT NULL,
  `crm_settings` text DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text DEFAULT NULL,
  `sms_settings` text DEFAULT NULL,
  `custom_labels` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_pay_1_pc` decimal(5,2) DEFAULT 0.00,
  `custom_pay_2_pc` decimal(5,2) DEFAULT 0.00,
  `custom_pay_3_pc` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `woocommerce_api_settings`, `woocommerce_skipped_orders`, `woocommerce_wh_oc_secret`, `woocommerce_wh_ou_secret`, `woocommerce_wh_od_secret`, `woocommerce_wh_or_secret`, `essentials_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `currency_precision`, `quantity_precision`, `ref_no_prefixes`, `theme_color`, `created_by`, `asset_settings`, `crm_settings`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`, `custom_pay_1_pc`, `custom_pay_2_pc`, `custom_pay_3_pc`) VALUES
(1, 'BARS', 14, '2025-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, 'America/La_Paz', 1, 'lifo', 0.00, 'includes', '1756317919_Copia de Copia de Copia de Copia de Copia de Copia de logo paleta 4.jpg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"display_screen_heading\":null,\"cash_denominations\":null,\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\",\"tables\",\"modifiers\"]', 'd/m/Y', '24', 2, 2, '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_requisition\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":\"Tarjeta Debito\",\"custom_pay_2\":\"Tarjeta Credito\",\"custom_pay_3\":\"Pix\",\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null,\"custom_field_11\":null,\"custom_field_12\":null,\"custom_field_13\":null,\"custom_field_14\":null,\"custom_field_15\":null,\"custom_field_16\":null,\"custom_field_17\":null,\"custom_field_18\":null,\"custom_field_19\":null,\"custom_field_20\":null},\"product_cf_details\":{\"1\":{\"type\":null,\"dropdown_options\":null},\"2\":{\"type\":null,\"dropdown_options\":null},\"3\":{\"type\":null,\"dropdown_options\":null},\"4\":{\"type\":null,\"dropdown_options\":null},\"5\":{\"type\":null,\"dropdown_options\":null},\"6\":{\"type\":null,\"dropdown_options\":null},\"7\":{\"type\":null,\"dropdown_options\":null},\"8\":{\"type\":null,\"dropdown_options\":null},\"9\":{\"type\":null,\"dropdown_options\":null},\"10\":{\"type\":null,\"dropdown_options\":null},\"11\":{\"type\":null,\"dropdown_options\":null},\"12\":{\"type\":null,\"dropdown_options\":null},\"13\":{\"type\":null,\"dropdown_options\":null},\"14\":{\"type\":null,\"dropdown_options\":null},\"15\":{\"type\":null,\"dropdown_options\":null},\"16\":{\"type\":null,\"dropdown_options\":null},\"17\":{\"type\":null,\"dropdown_options\":null},\"18\":{\"type\":null,\"dropdown_options\":null},\"19\":{\"type\":null,\"dropdown_options\":null},\"20\":{\"type\":null,\"dropdown_options\":null}},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2025-08-27 00:19:38', '2026-02-17 09:27:03', 0.20, 0.20, 0.35),
(2, 'NOVAMAX', 18, '2026-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 4, 'America/Campo_Grande', 1, 'lifo', 0.00, 'includes', '1769954953_132a5b0f-f498-4aac-9111-f5851b032f9b.jpg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"display_screen_heading\":null,\"cash_denominations\":null,\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'd/m/Y', '24', 2, 2, '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_requisition\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', 'sky', NULL, NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null,\"custom_field_11\":null,\"custom_field_12\":null,\"custom_field_13\":null,\"custom_field_14\":null,\"custom_field_15\":null,\"custom_field_16\":null,\"custom_field_17\":null,\"custom_field_18\":null,\"custom_field_19\":null,\"custom_field_20\":null},\"product_cf_details\":{\"1\":{\"type\":null,\"dropdown_options\":null},\"2\":{\"type\":null,\"dropdown_options\":null},\"3\":{\"type\":null,\"dropdown_options\":null},\"4\":{\"type\":null,\"dropdown_options\":null},\"5\":{\"type\":null,\"dropdown_options\":null},\"6\":{\"type\":null,\"dropdown_options\":null},\"7\":{\"type\":null,\"dropdown_options\":null},\"8\":{\"type\":null,\"dropdown_options\":null},\"9\":{\"type\":null,\"dropdown_options\":null},\"10\":{\"type\":null,\"dropdown_options\":null},\"11\":{\"type\":null,\"dropdown_options\":null},\"12\":{\"type\":null,\"dropdown_options\":null},\"13\":{\"type\":null,\"dropdown_options\":null},\"14\":{\"type\":null,\"dropdown_options\":null},\"15\":{\"type\":null,\"dropdown_options\":null},\"16\":{\"type\":null,\"dropdown_options\":null},\"17\":{\"type\":null,\"dropdown_options\":null},\"18\":{\"type\":null,\"dropdown_options\":null},\"19\":{\"type\":null,\"dropdown_options\":null},\"20\":{\"type\":null,\"dropdown_options\":null}},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2026-01-30 13:42:59', '2026-02-01 10:11:01', 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `landmark` text DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` char(7) NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_scheme_id` int(11) DEFAULT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `featured_products` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `sale_invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'BARS', 'calle ccc', 'Bolivia', 'Cochabamba', 'Cercado', '0000', 1, 1, 1, 1, NULL, 1, 'browser', NULL, '60903360', NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_4\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_5\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_6\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_7\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2025-08-27 00:19:38', '2025-09-25 16:44:14'),
(2, 1, '100', 'SPORT BARS', NULL, 'Bolivia', 'Cochabamba', 'Cochabamba', '0000', 1, 1, 1, 1, NULL, 1, 'browser', NULL, '72131666', NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_4\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_5\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_6\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_7\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2025-08-26 19:46:04', '2025-09-25 16:44:40'),
(3, 2, 'BL0001', 'NOVAMAX', 'rua dom Pedro segundo  Entre marechal Deodoro e Marechal Floriano lo BARRIO: Popular nova', 'BRASIL', 'Mato Grosso do Sul', 'Corumba-MS', '7932014', 2, NULL, 2, 2, NULL, 1, 'browser', NULL, '', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2026-01-30 13:42:59', '2026-01-30 13:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cash_denominations`
--

CREATE TABLE `cash_denominations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `total_count` int(11) NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `denominations` text DEFAULT NULL,
  `closing_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2025-08-26 14:50:00', '2025-08-26 14:50:50'),
(2, 1, 2, 2, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2025-08-27 14:53:00', '2025-08-27 14:53:27'),
(3, 2, 3, 5, 'close', '2026-02-02 10:03:21', 0.0000, 0, 0, NULL, NULL, '2026-02-02 10:02:00', '2026-02-02 10:03:21'),
(4, 2, 3, 8, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2026-02-02 11:28:00', '2026-02-02 11:28:05'),
(5, 2, 3, 5, 'close', '2026-02-02 19:22:02', 0.0000, 0, 0, NULL, NULL, '2026-02-02 19:20:00', '2026-02-02 19:22:02'),
(6, 2, 3, 5, 'close', '2026-02-02 21:02:54', 0.0000, 0, 0, NULL, NULL, '2026-02-02 21:00:00', '2026-02-02 21:02:54'),
(7, 2, 3, 5, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2026-02-13 15:26:00', '2026-02-13 15:26:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) DEFAULT NULL,
  `type` enum('debit','credit') NOT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 18:21:36', '2026-02-17 18:21:36'),
(2, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 18:21:38', '2026-02-17 18:21:38'),
(3, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 18:21:42', '2026-02-17 18:21:42'),
(30, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:05:15', '2026-02-17 19:05:15'),
(31, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:05:17', '2026-02-17 19:05:17'),
(32, 1, 20.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:06:50', '2026-02-17 19:06:50'),
(33, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:11:56', '2026-02-17 19:11:56'),
(34, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:12:00', '2026-02-17 19:12:00'),
(35, 1, 20.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:12:26', '2026-02-17 19:12:26'),
(36, 1, 3000.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:14:08', '2026-02-17 19:14:08'),
(37, 1, 3000.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:16:40', '2026-02-17 19:16:40'),
(38, 1, 3010.5000, 'custom_pay_3', 'credit', 'sell', 0, '2026-02-17 19:16:57', '2026-02-17 19:16:57'),
(39, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:26:42', '2026-02-17 19:26:42'),
(40, 1, 0.2300, 'cash', 'credit', 'sell', 0, '2026-02-17 19:28:53', '2026-02-17 19:28:53'),
(41, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:31:00', '2026-02-17 19:31:00'),
(42, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:34:13', '2026-02-17 19:34:13'),
(43, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:37:06', '2026-02-17 19:37:06'),
(44, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:38:20', '2026-02-17 19:38:20'),
(45, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:38:27', '2026-02-17 19:38:27'),
(46, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:38:33', '2026-02-17 19:38:33'),
(47, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:40:00', '2026-02-17 19:40:00'),
(48, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:41:54', '2026-02-17 19:41:54'),
(49, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:48:17', '2026-02-17 19:48:17'),
(52, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:50:01', '2026-02-17 19:50:01'),
(53, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:51:49', '2026-02-17 19:51:49'),
(54, 1, 3000.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:51:59', '2026-02-17 19:51:59'),
(55, 1, 3000.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 19:52:48', '2026-02-17 19:52:48'),
(56, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 20:41:04', '2026-02-17 20:41:04'),
(57, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 20:41:14', '2026-02-17 20:41:14'),
(58, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 20:42:05', '2026-02-17 20:42:05'),
(59, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 20:42:10', '2026-02-17 20:42:10'),
(60, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 20:46:14', '2026-02-17 20:46:14'),
(61, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 20:48:03', '2026-02-17 20:48:03'),
(62, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 20:54:00', '2026-02-17 20:54:00'),
(63, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 20:54:19', '2026-02-17 20:54:19'),
(64, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:01:27', '2026-02-17 21:01:27'),
(65, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:01:50', '2026-02-17 21:01:50'),
(66, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:05:39', '2026-02-17 21:05:39'),
(67, 1, 0.2300, 'cash', 'credit', 'sell', 0, '2026-02-17 21:23:08', '2026-02-17 21:23:08'),
(71, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:34:57', '2026-02-17 21:34:57'),
(72, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:35:03', '2026-02-17 21:35:03'),
(73, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:35:09', '2026-02-17 21:35:09'),
(74, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:39:54', '2026-02-17 21:39:54'),
(75, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:39:58', '2026-02-17 21:39:58'),
(76, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:40:02', '2026-02-17 21:40:02'),
(77, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:40:07', '2026-02-17 21:40:07'),
(78, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:57:41', '2026-02-17 21:57:41'),
(79, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 21:59:50', '2026-02-17 21:59:50'),
(80, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 22:08:19', '2026-02-17 22:08:19'),
(81, 1, 3512.2500, 'custom_pay_3', 'credit', 'sell', 0, '2026-02-17 22:12:54', '2026-02-17 22:12:54'),
(82, 1, 3500.0000, 'cash', 'credit', 'sell', 0, '2026-02-17 22:24:23', '2026-02-17 22:24:23'),
(88, 1, 0.2300, 'cash', 'credit', 'sell', 0, '2026-02-17 23:25:47', '2026-02-17 23:25:47'),
(89, 1, 0.2300, 'custom_pay_3', 'credit', 'sell', 0, '2026-02-17 23:26:05', '2026-02-17 23:26:05'),
(90, 1, 0.2300, 'custom_pay_3', 'credit', 'sell', 0, '2026-02-17 23:26:12', '2026-02-17 23:26:12'),
(91, 1, 2.0000, 'custom_pay_3', 'credit', 'sell', 0, '2026-02-17 23:26:31', '2026-02-17 23:26:31'),
(92, 1, -1.7700, 'cash', 'credit', 'sell', 0, '2026-02-17 23:26:31', '2026-02-17 23:26:31'),
(93, 1, 0.2300, 'card', 'credit', 'sell', 0, '2026-02-17 23:27:57', '2026-02-17 23:27:57'),
(94, 1, 0.2300, 'cash', 'credit', 'sell', 0, '2026-02-17 23:28:01', '2026-02-17 23:28:01'),
(95, 1, 0.2300, 'cash', 'credit', 'sell', 0, '2026-02-17 23:31:28', '2026-02-17 23:31:28'),
(99, 1, 0.2300, 'cash', 'credit', 'sell', 0, '2026-02-18 17:07:16', '2026-02-18 17:07:16'),
(100, 1, 0.2300, 'card', 'credit', 'sell', 0, '2026-02-18 17:09:50', '2026-02-18 17:09:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_cat_id` int(11) DEFAULT NULL,
  `category_type` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `woocommerce_cat_id`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'BEBIDAS', 1, '100', 0, 1, NULL, 'product', NULL, NULL, NULL, '2025-08-26 16:02:23', '2025-09-25 16:25:09'),
(2, 'COMIDAS', 1, '200', 0, 1, NULL, 'product', NULL, NULL, NULL, '2025-08-27 15:12:33', '2025-09-25 16:25:26'),
(3, 'MUEBLES Y ENSERES DE OFICINA', 1, NULL, 0, 1, NULL, 'asset', NULL, NULL, NULL, '2025-08-28 09:18:55', '2025-08-28 09:21:47'),
(4, 'HERRAMIENTAS', 1, NULL, 0, 1, NULL, 'asset', NULL, NULL, NULL, '2025-08-28 09:19:14', '2025-08-28 09:19:14'),
(5, 'INSUMOS', 1, '300', 0, 1, NULL, 'product', NULL, NULL, NULL, '2025-09-25 16:25:46', '2025-09-25 16:25:46'),
(6, 'POSTRES', 1, '400', 0, 1, NULL, 'product', NULL, NULL, NULL, '2025-09-25 16:26:02', '2025-09-25 16:26:02'),
(7, 'ACOUGUE', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:15', '2026-02-02 09:40:15'),
(8, 'ALIMENTOS/DULCES', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:15', '2026-02-02 09:40:15'),
(9, 'MASCOTAS', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:15', '2026-02-02 09:40:15'),
(10, 'VERDURAS', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:15', '2026-02-02 09:40:15'),
(11, 'ASEO PERSONAL', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(12, 'BEBES', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(13, 'BEBIDAS', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(14, 'CIGARO', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(15, 'DULCE', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(16, 'ESPECIES', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(17, 'FARMACIA', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(18, 'LIMPIEZA', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(19, 'SODAS/AGUAS/JUGOS', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(20, 'TRAGOS', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(21, 'VARIOS', 2, NULL, 0, 8, NULL, 'product', NULL, NULL, NULL, '2026-02-02 09:40:16', '2026-02-02 09:40:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT 133,
  `payment_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `account_subtype_id` bigint(20) UNSIGNED DEFAULT NULL,
  `detail_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` text DEFAULT NULL,
  `gl_code` int(11) DEFAULT NULL,
  `account_type` enum('asset','expense','equity','liability','income') NOT NULL DEFAULT 'asset',
  `opening_balance` decimal(11,2) NOT NULL DEFAULT 0.00,
  `reconcile_opening_balance` int(11) DEFAULT NULL,
  `allow_manual` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `contact_type` varchar(191) DEFAULT NULL,
  `land_mark` varchar(191) DEFAULT NULL,
  `street_name` varchar(191) DEFAULT NULL,
  `building_number` varchar(191) DEFAULT NULL,
  `additional_number` varchar(191) DEFAULT NULL,
  `supplier_business_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `middle_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_id` varchar(191) DEFAULT NULL,
  `contact_status` varchar(191) NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `landline` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `converted_by` int(11) DEFAULT NULL,
  `converted_on` datetime DEFAULT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `shipping_custom_field_details` longtext DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_field_1` varchar(191) DEFAULT NULL,
  `export_custom_field_2` varchar(191) DEFAULT NULL,
  `export_custom_field_3` varchar(191) DEFAULT NULL,
  `export_custom_field_4` varchar(191) DEFAULT NULL,
  `export_custom_field_5` varchar(191) DEFAULT NULL,
  `export_custom_field_6` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `crm_source` varchar(191) DEFAULT NULL,
  `crm_life_stage` varchar(191) DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `custom_field5` varchar(191) DEFAULT NULL,
  `custom_field6` varchar(191) DEFAULT NULL,
  `custom_field7` varchar(191) DEFAULT NULL,
  `custom_field8` varchar(191) DEFAULT NULL,
  `custom_field9` varchar(191) DEFAULT NULL,
  `custom_field10` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `contact_type`, `land_mark`, `street_name`, `building_number`, `additional_number`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `converted_by`, `converted_on`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `crm_source`, `crm_life_stage`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, NULL, NULL, NULL, NULL, NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 1, NULL, NULL, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(2, 1, 'supplier', 'business', NULL, NULL, NULL, NULL, 'GATO', '', NULL, NULL, NULL, NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-26 16:10:05', '2025-08-26 16:10:05'),
(3, 2, 'customer', NULL, NULL, NULL, NULL, NULL, NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 4, NULL, NULL, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(4, 2, 'customer', 'business', NULL, NULL, NULL, NULL, 'NICOLAS', '', NULL, NULL, NULL, NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '68627347', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01 09:55:24', '2026-02-01 09:55:24'),
(5, 2, 'customer', 'business', NULL, NULL, NULL, NULL, 'JANAINA', '', NULL, NULL, NULL, NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6796793742', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01 09:56:26', '2026-02-01 09:56:26'),
(6, 2, 'customer', 'business', NULL, NULL, NULL, NULL, 'BRENDHA', '', NULL, NULL, NULL, NULL, NULL, 'CO0004', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '76064240', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01 09:57:41', '2026-02-01 09:57:41'),
(7, 1, 'customer', NULL, '', NULL, NULL, NULL, '', 'Cliente General', NULL, 'Cliente', NULL, 'General', 'cliente@general.com', 'CLI-GEN-001', 'active', '', 'Santa Cruz', '', '', NULL, NULL, NULL, NULL, '00000000', NULL, NULL, 0, 'days', NULL, 1, NULL, NULL, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17 19:25:37', '2026-02-17 19:25:37'),
(8, 1, 'customer', 'individual', NULL, NULL, NULL, NULL, 'MIGUEL', 'Señor  Angel Miguel Genesis', 'Señor ', 'Angel', 'Miguel', 'Genesis', 'softw.corport@gmail.com', '2', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '74184096', '3503338', '74184096', NULL, NULL, NULL, 1, NULL, NULL, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17 19:28:42', '2026-02-17 19:28:42'),
(9, 1, 'customer', NULL, NULL, NULL, NULL, NULL, NULL, 'Cliente General', NULL, 'Cliente', NULL, 'General', NULL, 'CLI-001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17 19:32:07', '2026-02-17 19:32:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sortname` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `sortname`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', NULL, NULL),
(2, 'AL', 'Albania', NULL, NULL),
(3, 'DZ', 'Algeria', NULL, NULL),
(4, 'AS', 'American Samoa', NULL, NULL),
(5, 'AD', 'Andorra', NULL, NULL),
(6, 'AO', 'Angola', NULL, NULL),
(7, 'AI', 'Anguilla', NULL, NULL),
(8, 'AQ', 'Antarctica', NULL, NULL),
(9, 'AG', 'Antigua And Barbuda', NULL, NULL),
(10, 'AR', 'Argentina', NULL, NULL),
(11, 'AM', 'Armenia', NULL, NULL),
(12, 'AW', 'Aruba', NULL, NULL),
(13, 'AU', 'Australia', NULL, NULL),
(14, 'AT', 'Austria', NULL, NULL),
(15, 'AZ', 'Azerbaijan', NULL, NULL),
(16, 'BS', 'Bahamas The', NULL, NULL),
(17, 'BH', 'Bahrain', NULL, NULL),
(18, 'BD', 'Bangladesh', NULL, NULL),
(19, 'BB', 'Barbados', NULL, NULL),
(20, 'BY', 'Belarus', NULL, NULL),
(21, 'BE', 'Belgium', NULL, NULL),
(22, 'BZ', 'Belize', NULL, NULL),
(23, 'BJ', 'Benin', NULL, NULL),
(24, 'BM', 'Bermuda', NULL, NULL),
(25, 'BT', 'Bhutan', NULL, NULL),
(26, 'BO', 'Bolivia', NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', NULL, NULL),
(28, 'BW', 'Botswana', NULL, NULL),
(29, 'BV', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'Brazil', NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'Brunei', NULL, NULL),
(33, 'BG', 'Bulgaria', NULL, NULL),
(34, 'BF', 'Burkina Faso', NULL, NULL),
(35, 'BI', 'Burundi', NULL, NULL),
(36, 'KH', 'Cambodia', NULL, NULL),
(37, 'CM', 'Cameroon', NULL, NULL),
(38, 'CA', 'Canada', NULL, NULL),
(39, 'CV', 'Cape Verde', NULL, NULL),
(40, 'KY', 'Cayman Islands', NULL, NULL),
(41, 'CF', 'Central African Republic', NULL, NULL),
(42, 'TD', 'Chad', NULL, NULL),
(43, 'CL', 'Chile', NULL, NULL),
(44, 'CN', 'China', NULL, NULL),
(45, 'CX', 'Christmas Island', NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'Colombia', NULL, NULL),
(48, 'KM', 'Comoros', NULL, NULL),
(49, 'CG', 'Congo', NULL, NULL),
(50, 'CD', 'Congo The Democratic Republic Of The', NULL, NULL),
(51, 'CK', 'Cook Islands', NULL, NULL),
(52, 'CR', 'Costa Rica', NULL, NULL),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', NULL, NULL),
(54, 'HR', 'Croatia (Hrvatska)', NULL, NULL),
(55, 'CU', 'Cuba', NULL, NULL),
(56, 'CY', 'Cyprus', NULL, NULL),
(57, 'CZ', 'Czech Republic', NULL, NULL),
(58, 'DK', 'Denmark', NULL, NULL),
(59, 'DJ', 'Djibouti', NULL, NULL),
(60, 'DM', 'Dominica', NULL, NULL),
(61, 'DO', 'Dominican Republic', NULL, NULL),
(62, 'TP', 'East Timor', NULL, NULL),
(63, 'EC', 'Ecuador', NULL, NULL),
(64, 'EG', 'Egypt', NULL, NULL),
(65, 'SV', 'El Salvador', NULL, NULL),
(66, 'GQ', 'Equatorial Guinea', NULL, NULL),
(67, 'ER', 'Eritrea', NULL, NULL),
(68, 'EE', 'Estonia', NULL, NULL),
(69, 'ET', 'Ethiopia', NULL, NULL),
(70, 'XA', 'External Territories of Australia', NULL, NULL),
(71, 'FK', 'Falkland Islands', NULL, NULL),
(72, 'FO', 'Faroe Islands', NULL, NULL),
(73, 'FJ', 'Fiji Islands', NULL, NULL),
(74, 'FI', 'Finland', NULL, NULL),
(75, 'FR', 'France', NULL, NULL),
(76, 'GF', 'French Guiana', NULL, NULL),
(77, 'PF', 'French Polynesia', NULL, NULL),
(78, 'TF', 'French Southern Territories', NULL, NULL),
(79, 'GA', 'Gabon', NULL, NULL),
(80, 'GM', 'Gambia The', NULL, NULL),
(81, 'GE', 'Georgia', NULL, NULL),
(82, 'DE', 'Germany', NULL, NULL),
(83, 'GH', 'Ghana', NULL, NULL),
(84, 'GI', 'Gibraltar', NULL, NULL),
(85, 'GR', 'Greece', NULL, NULL),
(86, 'GL', 'Greenland', NULL, NULL),
(87, 'GD', 'Grenada', NULL, NULL),
(88, 'GP', 'Guadeloupe', NULL, NULL),
(89, 'GU', 'Guam', NULL, NULL),
(90, 'GT', 'Guatemala', NULL, NULL),
(91, 'XU', 'Guernsey and Alderney', NULL, NULL),
(92, 'GN', 'Guinea', NULL, NULL),
(93, 'GW', 'Guinea-Bissau', NULL, NULL),
(94, 'GY', 'Guyana', NULL, NULL),
(95, 'HT', 'Haiti', NULL, NULL),
(96, 'HM', 'Heard and McDonald Islands', NULL, NULL),
(97, 'HN', 'Honduras', NULL, NULL),
(98, 'HK', 'Hong Kong S.A.R.', NULL, NULL),
(99, 'HU', 'Hungary', NULL, NULL),
(100, 'IS', 'Iceland', NULL, NULL),
(101, 'IN', 'India', NULL, NULL),
(102, 'ID', 'Indonesia', NULL, NULL),
(103, 'IR', 'Iran', NULL, NULL),
(104, 'IQ', 'Iraq', NULL, NULL),
(105, 'IE', 'Ireland', NULL, NULL),
(106, 'IL', 'Israel', NULL, NULL),
(107, 'IT', 'Italy', NULL, NULL),
(108, 'JM', 'Jamaica', NULL, NULL),
(109, 'JP', 'Japan', NULL, NULL),
(110, 'XJ', 'Jersey', NULL, NULL),
(111, 'JO', 'Jordan', NULL, NULL),
(112, 'KZ', 'Kazakhstan', NULL, NULL),
(113, 'KE', 'Kenya', NULL, NULL),
(114, 'KI', 'Kiribati', NULL, NULL),
(115, 'KP', 'Korea North', NULL, NULL),
(116, 'KR', 'Korea South', NULL, NULL),
(117, 'KW', 'Kuwait', NULL, NULL),
(118, 'KG', 'Kyrgyzstan', NULL, NULL),
(119, 'LA', 'Laos', NULL, NULL),
(120, 'LV', 'Latvia', NULL, NULL),
(121, 'LB', 'Lebanon', NULL, NULL),
(122, 'LS', 'Lesotho', NULL, NULL),
(123, 'LR', 'Liberia', NULL, NULL),
(124, 'LY', 'Libya', NULL, NULL),
(125, 'LI', 'Liechtenstein', NULL, NULL),
(126, 'LT', 'Lithuania', NULL, NULL),
(127, 'LU', 'Luxembourg', NULL, NULL),
(128, 'MO', 'Macau S.A.R.', NULL, NULL),
(129, 'MK', 'Macedonia', NULL, NULL),
(130, 'MG', 'Madagascar', NULL, NULL),
(131, 'MW', 'Malawi', NULL, NULL),
(132, 'MY', 'Malaysia', NULL, NULL),
(133, 'MV', 'Maldives', NULL, NULL),
(134, 'ML', 'Mali', NULL, NULL),
(135, 'MT', 'Malta', NULL, NULL),
(136, 'XM', 'Man (Isle of)', NULL, NULL),
(137, 'MH', 'Marshall Islands', NULL, NULL),
(138, 'MQ', 'Martinique', NULL, NULL),
(139, 'MR', 'Mauritania', NULL, NULL),
(140, 'MU', 'Mauritius', NULL, NULL),
(141, 'YT', 'Mayotte', NULL, NULL),
(142, 'MX', 'Mexico', NULL, NULL),
(143, 'FM', 'Micronesia', NULL, NULL),
(144, 'MD', 'Moldova', NULL, NULL),
(145, 'MC', 'Monaco', NULL, NULL),
(146, 'MN', 'Mongolia', NULL, NULL),
(147, 'MS', 'Montserrat', NULL, NULL),
(148, 'MA', 'Morocco', NULL, NULL),
(149, 'MZ', 'Mozambique', NULL, NULL),
(150, 'MM', 'Myanmar', NULL, NULL),
(151, 'NA', 'Namibia', NULL, NULL),
(152, 'NR', 'Nauru', NULL, NULL),
(153, 'NP', 'Nepal', NULL, NULL),
(154, 'AN', 'Netherlands Antilles', NULL, NULL),
(155, 'NL', 'Netherlands The', NULL, NULL),
(156, 'NC', 'New Caledonia', NULL, NULL),
(157, 'NZ', 'New Zealand', NULL, NULL),
(158, 'NI', 'Nicaragua', NULL, NULL),
(159, 'NE', 'Niger', NULL, NULL),
(160, 'NG', 'Nigeria', NULL, NULL),
(161, 'NU', 'Niue', NULL, NULL),
(162, 'NF', 'Norfolk Island', NULL, NULL),
(163, 'MP', 'Northern Mariana Islands', NULL, NULL),
(164, 'NO', 'Norway', NULL, NULL),
(165, 'OM', 'Oman', NULL, NULL),
(166, 'PK', 'Pakistan', NULL, NULL),
(167, 'PW', 'Palau', NULL, NULL),
(168, 'PS', 'Palestinian Territory Occupied', NULL, NULL),
(169, 'PA', 'Panama', NULL, NULL),
(170, 'PG', 'Papua new Guinea', NULL, NULL),
(171, 'PY', 'Paraguay', NULL, NULL),
(172, 'PE', 'Peru', NULL, NULL),
(173, 'PH', 'Philippines', NULL, NULL),
(174, 'PN', 'Pitcairn Island', NULL, NULL),
(175, 'PL', 'Poland', NULL, NULL),
(176, 'PT', 'Portugal', NULL, NULL),
(177, 'PR', 'Puerto Rico', NULL, NULL),
(178, 'QA', 'Qatar', NULL, NULL),
(179, 'RE', 'Reunion', NULL, NULL),
(180, 'RO', 'Romania', NULL, NULL),
(181, 'RU', 'Russia', NULL, NULL),
(182, 'RW', 'Rwanda', NULL, NULL),
(183, 'SH', 'Saint Helena', NULL, NULL),
(184, 'KN', 'Saint Kitts And Nevis', NULL, NULL),
(185, 'LC', 'Saint Lucia', NULL, NULL),
(186, 'PM', 'Saint Pierre and Miquelon', NULL, NULL),
(187, 'VC', 'Saint Vincent And The Grenadines', NULL, NULL),
(188, 'WS', 'Samoa', NULL, NULL),
(189, 'SM', 'San Marino', NULL, NULL),
(190, 'ST', 'Sao Tome and Principe', NULL, NULL),
(191, 'SA', 'Saudi Arabia', NULL, NULL),
(192, 'SN', 'Senegal', NULL, NULL),
(193, 'RS', 'Serbia', NULL, NULL),
(194, 'SC', 'Seychelles', NULL, NULL),
(195, 'SL', 'Sierra Leone', NULL, NULL),
(196, 'SG', 'Singapore', NULL, NULL),
(197, 'SK', 'Slovakia', NULL, NULL),
(198, 'SI', 'Slovenia', NULL, NULL),
(199, 'XG', 'Smaller Territories of the UK', NULL, NULL),
(200, 'SB', 'Solomon Islands', NULL, NULL),
(201, 'SO', 'Somalia', NULL, NULL),
(202, 'ZA', 'South Africa', NULL, NULL),
(203, 'GS', 'South Georgia', NULL, NULL),
(204, 'SS', 'South Sudan', NULL, NULL),
(205, 'ES', 'Spain', NULL, NULL),
(206, 'LK', 'Sri Lanka', NULL, NULL),
(207, 'SD', 'Sudan', NULL, NULL),
(208, 'SR', 'Suriname', NULL, NULL),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', NULL, NULL),
(210, 'SZ', 'Swaziland', NULL, NULL),
(211, 'SE', 'Sweden', NULL, NULL),
(212, 'CH', 'Switzerland', NULL, NULL),
(213, 'SY', 'Syria', NULL, NULL),
(214, 'TW', 'Taiwan', NULL, NULL),
(215, 'TJ', 'Tajikistan', NULL, NULL),
(216, 'TZ', 'Tanzania', NULL, NULL),
(217, 'TH', 'Thailand', NULL, NULL),
(218, 'TG', 'Togo', NULL, NULL),
(219, 'TK', 'Tokelau', NULL, NULL),
(220, 'TO', 'Tonga', NULL, NULL),
(221, 'TT', 'Trinidad And Tobago', NULL, NULL),
(222, 'TN', 'Tunisia', NULL, NULL),
(223, 'TR', 'Turkey', NULL, NULL),
(224, 'TM', 'Turkmenistan', NULL, NULL),
(225, 'TC', 'Turks And Caicos Islands', NULL, NULL),
(226, 'TV', 'Tuvalu', NULL, NULL),
(227, 'UG', 'Uganda', NULL, NULL),
(228, 'UA', 'Ukraine', NULL, NULL),
(229, 'AE', 'United Arab Emirates', NULL, NULL),
(230, 'GB', 'United Kingdom', NULL, NULL),
(231, 'US', 'United States', NULL, NULL),
(232, 'UM', 'United States Minor Outlying Islands', NULL, NULL),
(233, 'UY', 'Uruguay', NULL, NULL),
(234, 'UZ', 'Uzbekistan', NULL, NULL),
(235, 'VU', 'Vanuatu', NULL, NULL),
(236, 'VA', 'Vatican City State (Holy See)', NULL, NULL),
(237, 'VE', 'Venezuela', NULL, NULL),
(238, 'VN', 'Vietnam', NULL, NULL),
(239, 'VG', 'Virgin Islands (British)', NULL, NULL),
(240, 'VI', 'Virgin Islands (US)', NULL, NULL),
(241, 'WF', 'Wallis And Futuna Islands', NULL, NULL),
(242, 'EH', 'Western Sahara', NULL, NULL),
(243, 'YE', 'Yemen', NULL, NULL),
(244, 'YU', 'Yugoslavia', NULL, NULL),
(245, 'ZM', 'Zambia', NULL, NULL),
(246, 'ZW', 'Zimbabwe', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_call_logs`
--

CREATE TABLE `crm_call_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `call_type` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `mobile_name` varchar(191) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_campaigns`
--

CREATE TABLE `crm_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `campaign_type` enum('sms','email') NOT NULL DEFAULT 'email',
  `subject` varchar(191) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `sent_on` datetime DEFAULT NULL,
  `contact_ids` text NOT NULL,
  `additional_info` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_contact_person_commissions`
--

CREATE TABLE `crm_contact_person_commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_person_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `commission_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_followup_invoices`
--

CREATE TABLE `crm_followup_invoices` (
  `follow_up_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_lead_users`
--

CREATE TABLE `crm_lead_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_marketplaces`
--

CREATE TABLE `crm_marketplaces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `marketplace` varchar(191) DEFAULT NULL,
  `site_key` varchar(191) DEFAULT NULL,
  `site_id` varchar(191) DEFAULT NULL,
  `assigned_users` text DEFAULT NULL,
  `crm_source_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_proposals`
--

CREATE TABLE `crm_proposals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `subject` text NOT NULL,
  `body` longtext NOT NULL,
  `cc` text DEFAULT NULL,
  `bcc` text DEFAULT NULL,
  `sent_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_proposal_templates`
--

CREATE TABLE `crm_proposal_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `subject` text NOT NULL,
  `body` longtext NOT NULL,
  `cc` text DEFAULT NULL,
  `bcc` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_schedules`
--

CREATE TABLE `crm_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `schedule_type` enum('call','sms','meeting','email') NOT NULL DEFAULT 'email',
  `followup_category_id` int(11) DEFAULT NULL,
  `allow_notification` tinyint(1) NOT NULL DEFAULT 1,
  `notify_via` text DEFAULT NULL,
  `notify_before` int(11) DEFAULT NULL,
  `notify_type` enum('minute','hour','day') NOT NULL DEFAULT 'hour',
  `created_by` int(11) NOT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT 0,
  `recursion_days` int(11) DEFAULT NULL,
  `followup_additional_info` text DEFAULT NULL,
  `follow_up_by` varchar(191) DEFAULT NULL,
  `follow_up_by_value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_schedule_logs`
--

CREATE TABLE `crm_schedule_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `log_type` enum('call','sms','meeting','email') NOT NULL DEFAULT 'email',
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `subject` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crm_schedule_users`
--

CREATE TABLE `crm_schedule_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `code` varchar(25) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `thousand_separator` varchar(10) NOT NULL,
  `decimal_separator` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', 'Bs.', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `configuration` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `spg` varchar(100) DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) NOT NULL,
  `heading` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_allowances_and_deductions`
--

CREATE TABLE `essentials_allowances_and_deductions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` varchar(191) NOT NULL,
  `type` enum('allowance','deduction') NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `amount_type` enum('fixed','percent') NOT NULL,
  `applicable_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_attendances`
--

CREATE TABLE `essentials_attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `clock_in_time` datetime DEFAULT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `essentials_shift_id` int(11) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `clock_in_note` text DEFAULT NULL,
  `clock_out_note` text DEFAULT NULL,
  `clock_in_location` text DEFAULT NULL,
  `clock_out_location` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_documents`
--

CREATE TABLE `essentials_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_document_shares`
--

CREATE TABLE `essentials_document_shares` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` int(11) NOT NULL,
  `value_type` enum('user','role') NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_holidays`
--

CREATE TABLE `essentials_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `business_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_kb`
--

CREATE TABLE `essentials_kb` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `kb_type` varchar(191) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'id from essentials_kb table',
  `share_with` varchar(191) DEFAULT NULL COMMENT 'public, private, only_with',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_kb_users`
--

CREATE TABLE `essentials_kb_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kb_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_leaves`
--

CREATE TABLE `essentials_leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `essentials_leave_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `status` enum('pending','approved','cancelled') DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_leave_types`
--

CREATE TABLE `essentials_leave_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `leave_type` varchar(191) NOT NULL,
  `max_leave_count` int(11) DEFAULT NULL,
  `leave_count_interval` enum('month','year') DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_messages`
--

CREATE TABLE `essentials_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `essentials_messages`
--

INSERT INTO `essentials_messages` (`id`, `business_id`, `user_id`, `message`, `location_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'mensaje de prueba', 1, '2025-08-27 14:48:27', '2025-08-27 14:48:27'),
(2, 1, 1, 'mensaje 2', 2, '2025-08-27 14:50:29', '2025-08-27 14:50:29'),
(3, 1, 1, 'aasdasda', 2, '2025-08-27 14:50:46', '2025-08-27 14:50:46'),
(4, 1, 1, 'asdasdadasdasdasdas', NULL, '2025-08-27 14:50:54', '2025-08-27 14:50:54'),
(5, 1, 1, 'otra', 2, '2025-08-27 14:56:19', '2025-08-27 14:56:19'),
(6, 1, 2, 'hola', NULL, '2025-08-27 15:01:30', '2025-08-27 15:01:30'),
(7, 1, 2, 'nuevo', NULL, '2025-08-27 15:04:40', '2025-08-27 15:04:40'),
(8, 1, 2, 'itra vez', NULL, '2025-08-27 15:05:05', '2025-08-27 15:05:05'),
(9, 1, 2, 'asdasdadasd', NULL, '2025-08-27 15:09:14', '2025-08-27 15:09:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_payroll_groups`
--

CREATE TABLE `essentials_payroll_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'payroll for work location',
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `payment_status` varchar(191) NOT NULL DEFAULT 'due',
  `gross_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_payroll_group_transactions`
--

CREATE TABLE `essentials_payroll_group_transactions` (
  `payroll_group_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_reminders`
--

CREATE TABLE `essentials_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `repeat` enum('one_time','every_day','every_week','every_month') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_shifts`
--

CREATE TABLE `essentials_shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` enum('fixed_shift','flexible_shift') NOT NULL DEFAULT 'fixed_shift',
  `business_id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `is_allowed_auto_clockout` tinyint(1) NOT NULL DEFAULT 0,
  `auto_clockout_time` time DEFAULT NULL,
  `holidays` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_todos_users`
--

CREATE TABLE `essentials_todos_users` (
  `todo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_todo_comments`
--

CREATE TABLE `essentials_todo_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `task_id` int(11) NOT NULL,
  `comment_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_to_dos`
--

CREATE TABLE `essentials_to_dos` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `task` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `task_id` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `estimated_hours` varchar(191) DEFAULT NULL,
  `priority` varchar(191) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_user_allowance_and_deductions`
--

CREATE TABLE `essentials_user_allowance_and_deductions` (
  `user_id` int(11) NOT NULL,
  `allowance_deduction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_user_sales_targets`
--

CREATE TABLE `essentials_user_sales_targets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `target_start` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `target_end` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `commission_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `essentials_user_shifts`
--

CREATE TABLE `essentials_user_shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `essentials_shift_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `business_id`, `code`, `parent_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'GASTOS ADMINISTRATIVOS', 1, '100', NULL, NULL, '2025-09-25 16:57:12', '2025-09-25 16:57:12'),
(2, 'GASTOS COMERCIALES', 1, '200', NULL, NULL, '2025-09-25 16:57:28', '2025-09-25 16:57:28'),
(3, 'Alquileres', 1, '101', 1, NULL, '2025-10-10 19:53:22', '2025-10-10 19:53:32'),
(4, 'Publicidad', 1, '201', 2, NULL, '2025-10-10 19:53:53', '2025-10-10 19:53:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `header_text` text DEFAULT NULL,
  `invoice_no_prefix` varchar(191) DEFAULT NULL,
  `quotation_no_prefix` varchar(191) DEFAULT NULL,
  `invoice_heading` varchar(191) DEFAULT NULL,
  `sub_heading_line1` varchar(191) DEFAULT NULL,
  `sub_heading_line2` varchar(191) DEFAULT NULL,
  `sub_heading_line3` varchar(191) DEFAULT NULL,
  `sub_heading_line4` varchar(191) DEFAULT NULL,
  `sub_heading_line5` varchar(191) DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) DEFAULT NULL,
  `invoice_heading_paid` varchar(191) DEFAULT NULL,
  `quotation_heading` varchar(191) DEFAULT NULL,
  `sub_total_label` varchar(191) DEFAULT NULL,
  `discount_label` varchar(191) DEFAULT NULL,
  `tax_label` varchar(191) DEFAULT NULL,
  `total_label` varchar(191) DEFAULT NULL,
  `round_off_label` varchar(191) DEFAULT NULL,
  `total_due_label` varchar(191) DEFAULT NULL,
  `paid_label` varchar(191) DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) DEFAULT NULL,
  `client_tax_label` varchar(191) DEFAULT NULL,
  `date_label` varchar(191) DEFAULT NULL,
  `date_time_format` varchar(191) DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) DEFAULT NULL,
  `table_qty_label` varchar(191) DEFAULT NULL,
  `table_unit_price_label` varchar(191) DEFAULT NULL,
  `table_subtotal_label` varchar(191) DEFAULT NULL,
  `cat_code_label` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) DEFAULT NULL,
  `commission_agent_label` varchar(191) DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `module_info` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `show_letter_head` tinyint(1) NOT NULL DEFAULT 0,
  `letter_head` varchar(191) DEFAULT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `qr_code_fields` text DEFAULT NULL,
  `design` varchar(190) DEFAULT 'classic',
  `cn_heading` varchar(191) DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) DEFAULT NULL,
  `cn_amount_label` varchar(191) DEFAULT NULL,
  `table_tax_headings` text DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) DEFAULT NULL,
  `change_return_label` varchar(191) DEFAULT NULL,
  `product_custom_fields` text DEFAULT NULL,
  `contact_custom_fields` text DEFAULT NULL,
  `location_custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_letter_head`, `letter_head`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 1, 0, NULL, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(2, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 2, 0, NULL, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2026-01-30 13:42:59', '2026-01-30 13:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `scheme_type` enum('blank','year') NOT NULL,
  `number_type` varchar(100) NOT NULL DEFAULT 'sequential',
  `prefix` varchar(191) DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `number_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', 'sequential', '', 1, 64, 4, 1, '2025-08-27 00:19:38', '2026-02-18 17:09:49'),
(2, 2, 'Default', 'blank', 'sequential', '', 1, 0, 4, 1, '2026-01-30 13:42:59', '2026-01-30 13:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_number` varchar(191) DEFAULT NULL,
  `payment_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `transaction_sub_type` varchar(191) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` varchar(191) DEFAULT NULL,
  `year` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `contact_id` int(10) UNSIGNED DEFAULT NULL,
  `debit` decimal(65,4) DEFAULT NULL,
  `credit` decimal(65,4) DEFAULT NULL,
  `balance` decimal(65,4) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `reversed` tinyint(4) NOT NULL DEFAULT 0,
  `reversible` tinyint(4) NOT NULL DEFAULT 1,
  `manual_entry` tinyint(4) NOT NULL DEFAULT 0,
  `receipt` varchar(191) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) NOT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `model_media_type` varchar(191) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `woocommerce_media_id`, `model_media_type`, `model_id`, `created_at`, `updated_at`) VALUES
(0, 1, '1771295762_857908812_9b1b3506-c48c-4564-9b47-f42df5318039.webp', NULL, 1, 'App\\Variation', NULL, NULL, 0, '2026-02-17 02:36:03', '2026-02-17 02:36:03'),
(1, 1, '1756387252_1919804208_descarga.jfif', 'Escritorio asignado a Gerencia', 1, 'Modules\\AssetManagement\\Entities\\Asset', NULL, NULL, 1, '2025-08-28 09:20:52', '2025-08-28 09:20:52'),
(2, 2, '1769795372_1938312525_b13b8eea-ec13-4d03-9290-a049d1398967.jfif', NULL, 5, 'App\\User', NULL, NULL, 5, '2026-01-30 13:49:32', '2026-01-30 13:49:32'),
(3, 2, '1769795821_666766584_LOGO MULTISOFT DIC2024.png', NULL, 4, 'App\\User', NULL, NULL, 4, '2026-01-30 13:57:01', '2026-01-30 13:57:01'),
(4, 2, '1770066121_1065600826_alcool zumbi.jpeg', NULL, 5, 'App\\Product', NULL, NULL, 434, '2026-02-02 17:02:01', '2026-02-02 17:02:01'),
(5, 2, '1770067772_1905050075_arroz concordia.png', NULL, 5, 'App\\Variation', NULL, NULL, 254, '2026-02-02 17:29:32', '2026-02-02 17:29:32'),
(7, 2, '1770208512_2054201357_1000027111.jpg', NULL, 7, 'App\\Variation', NULL, NULL, 107, '2026-02-04 08:35:12', '2026-02-04 08:35:12'),
(8, 2, '1770223245_147306758_1000819320.jpg', NULL, 7, 'App\\User', NULL, NULL, 7, '2026-02-04 12:40:45', '2026-02-04 12:40:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(127, '2018_09_04_155900_create_accounts_table', 1),
(128, '2018_09_06_114438_create_selling_price_groups_table', 1),
(129, '2018_09_06_154057_create_variation_group_prices_table', 1),
(130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(133, '2018_09_10_152703_create_account_transactions_table', 1),
(134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(135, '2018_09_19_123914_create_notification_templates_table', 1),
(136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(143, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(147, '2018_10_22_134428_modify_variable_product_data', 1),
(148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(152, '2018_10_31_175627_add_user_contact_access', 1),
(153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(155, '2018_11_08_105621_add_role_permissions', 1),
(156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(159, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(160, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(161, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(163, '2018_12_14_103307_modify_system_table', 1),
(164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(168, '2018_12_24_154933_create_notifications_table', 1),
(169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(170, '2019_01_10_124645_add_account_permission', 1),
(171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(174, '2019_02_19_103118_create_discounts_table', 1),
(175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(176, '2019_02_21_134324_add_permission_for_discount', 1),
(177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(180, '2019_03_12_120336_create_activity_log_table', 1),
(181, '2019_03_15_132925_create_media_table', 1),
(182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(183, '2019_05_10_132311_add_missing_column_indexing', 1),
(184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(185, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(188, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(191, '2019_07_15_165136_add_fields_for_combo_product', 1),
(192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(195, '2019_08_08_162302_add_sub_units_related_fields', 1),
(196, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(197, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(198, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(200, '2019_09_04_184008_create_types_of_services_table', 1),
(201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(203, '2019_09_12_105616_create_product_locations_table', 1),
(204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(206, '2019_09_19_170927_close_all_active_registers', 1),
(207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(208, '2019_10_18_155633_create_account_types_table', 1),
(209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(210, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(211, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(215, '2019_12_02_105025_create_warranties_table', 1),
(216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(217, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(222, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(223, '2020_01_08_133506_create_document_and_notes_table', 1),
(224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(232, '2020_04_15_151802_add_user_type_to_users_table', 1),
(233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(236, '2020_06_12_162245_modify_contacts_table', 1),
(237, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(242, '2020_09_22_121639_create_discount_variations_table', 1),
(243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(247, '2020_11_10_152841_add_cash_register_permissions', 1),
(248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(249, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1),
(250, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1),
(251, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1),
(252, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1),
(253, '2020_12_29_165925_add_model_document_type_to_media_table', 1),
(254, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1),
(255, '2021_02_11_172217_add_indexing_for_multiple_columns', 1),
(256, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1),
(257, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1),
(258, '2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table', 1),
(259, '2021_03_11_120229_add_sales_order_columns', 1),
(260, '2021_03_16_120705_add_business_id_to_activity_log_table', 1),
(261, '2021_03_16_153427_add_code_columns_to_business_table', 1),
(262, '2021_03_18_173308_add_account_details_column_to_accounts_table', 1),
(263, '2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table', 1),
(264, '2021_03_22_120810_add_more_types_of_service_custom_fields', 1),
(265, '2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table', 1),
(266, '2021_03_25_170715_add_export_custom_fields_info_to_transactions_table', 1),
(267, '2021_04_15_063449_add_denominations_column_to_cash_registers_table', 1),
(268, '2021_05_22_083426_add_indexing_to_account_transactions_table', 1),
(269, '2021_07_08_065808_add_additional_expense_columns_to_transaction_table', 1),
(270, '2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table', 1),
(271, '2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout', 1),
(272, '2021_08_13_105549_add_crm_contact_id_to_users_table', 1),
(273, '2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table', 1),
(274, '2021_09_01_063110_add_spg_column_to_discounts_table', 1),
(275, '2021_09_03_061528_modify_cash_register_transactions_table', 1),
(276, '2021_10_05_061658_add_source_column_to_transactions_table', 1),
(277, '2021_12_16_121851_add_parent_id_column_to_expense_categories_table', 1),
(278, '2022_04_14_075120_add_payment_type_column_to_transaction_payments_table', 1),
(279, '2022_04_21_083327_create_cash_denominations_table', 1),
(280, '2022_05_10_055307_add_delivery_date_column_to_transactions_table', 1),
(281, '2022_06_13_123135_add_currency_precision_and_quantity_precision_fields_to_business_table', 1),
(282, '2022_06_28_133342_add_secondary_unit_columns_to_products_sell_line_purchase_lines_tables', 1),
(283, '2022_07_13_114307_create_purchase_requisition_related_columns', 1),
(284, '2022_08_25_132707_add_service_staff_timer_fields_to_products_and_users_table', 1),
(285, '2023_01_28_114255_add_letter_head_column_to_invoice_layouts_table', 1),
(286, '2023_02_11_161510_add_event_column_to_activity_log_table', 1),
(287, '2023_02_11_161511_add_batch_uuid_column_to_activity_log_table', 1),
(288, '2023_03_02_170312_add_provider_to_oauth_clients_table', 1),
(289, '2023_03_21_122731_add_sale_invoice_scheme_id_business_table', 1),
(290, '2023_03_21_170446_add_number_type_to_invoice_scheme', 1),
(291, '2023_04_17_155216_add_custom_fields_to_products', 1),
(292, '2023_04_28_130247_add_price_type_to_group_price_table', 1),
(293, '2023_06_21_033923_add_delivery_person_in_transactions', 1),
(294, '2023_09_13_153555_add_service_staff_pin_columns_in_users', 1),
(295, '2023_09_15_154404_add_is_kitchen_order_in_transactions', 1),
(296, '2023_12_06_152840_add_contact_type_in_contacts', 1),
(297, '2024_10_03_151459_modify_transaction_sell_lines_purchase_lines_table', 1),
(298, '2025_03_07_114637_add_more_addresh_column_in_contact', 1),
(299, '2024_03_31_151352_create_multi_currency_settings_table', 2),
(300, '2024_03_31_153849_create_transaction_exchange_rates_table', 2),
(301, '2020_03_19_130231_add_contact_id_to_users_table', 3),
(302, '2020_03_27_133605_create_schedules_table', 3),
(303, '2020_03_27_133628_create_schedule_users_table', 3),
(304, '2020_03_30_112834_create_schedule_logs_table', 3),
(305, '2020_04_02_182331_add_crm_module_version_to_system_table', 3),
(306, '2020_04_08_153231_modify_cloumn_in_contacts_table', 3),
(307, '2020_04_09_101052_create_lead_users_table', 3),
(308, '2020_04_16_114747_create_crm_campaigns_table', 3),
(309, '2021_01_07_155757_add_followup_additional_info_column_to_crm_schedules_table', 3),
(310, '2021_02_02_140021_add_additional_info_to_crm_campaigns_table', 3),
(311, '2021_02_02_173651_add_new_columns_to_contacts_table', 3),
(312, '2021_02_04_120439_create_call_logs_table', 3),
(313, '2021_02_08_172047_add_mobile_name_column_to_crm_call_logs_table', 3),
(314, '2021_02_16_190038_add_crm_module_indexing', 3),
(315, '2021_02_19_120846_create_crm_followup_invoices', 3),
(316, '2021_02_22_132125_add_follow_up_by_to_crm_schedules_table', 3),
(317, '2021_03_24_160736_add_department_and_designation_to_users_table', 3),
(318, '2021_06_15_152924_create_proposal_templates_table', 3),
(319, '2021_06_16_114448_add_recursive_fields_to_crm_schedules_table', 3),
(320, '2021_06_16_125740_create_proposals_table', 3),
(321, '2021_09_24_065738_add_crm_settings_column_to_business_table', 3),
(322, '2022_02_09_055012_create_crm_marketplaces_table', 3),
(323, '2022_02_17_113045_add_source_id_to_marketplace', 3),
(324, '2022_03_02_180929_add_followup_category_id', 3),
(325, '2022_05_26_061553_create_crm_contact_person_commissions_table', 3),
(326, '2022_06_06_073006_add_cc_and_bcc_columns_to_crm_proposals_table', 3),
(327, '2018_10_01_151252_create_documents_table', 4),
(328, '2018_10_02_151803_create_document_shares_table', 4),
(329, '2018_10_09_134558_create_reminders_table', 4),
(330, '2018_11_16_170756_create_to_dos_table', 4),
(331, '2019_02_22_120329_essentials_messages', 4),
(332, '2019_02_22_161513_add_message_permissions', 4),
(333, '2019_03_29_164339_add_essentials_version_to_system_table', 4),
(334, '2019_05_17_153306_create_essentials_leave_types_table', 4),
(335, '2019_05_17_175921_create_essentials_leaves_table', 4),
(336, '2019_05_21_154517_add_essentials_settings_columns_to_business_table', 4),
(337, '2019_05_21_181653_create_table_essentials_attendance', 4),
(338, '2019_05_30_110049_create_essentials_payrolls_table', 4),
(339, '2019_06_04_105723_create_essentials_holidays_table', 4),
(340, '2019_06_28_134217_add_payroll_columns_to_transactions_table', 4),
(341, '2019_08_26_103520_add_approve_leave_permission', 4),
(342, '2019_08_27_103724_create_essentials_allowance_and_deduction_table', 4),
(343, '2019_08_27_105236_create_essentials_user_allowances_and_deductions', 4),
(344, '2019_09_20_115906_add_more_columns_to_essentials_to_dos_table', 4),
(345, '2019_09_23_120439_create_essentials_todo_comments_table', 4),
(346, '2019_12_05_170724_add_hrm_columns_to_users_table', 4),
(347, '2019_12_09_105809_add_allowance_and_deductions_permission', 4),
(348, '2020_03_28_152838_create_essentials_shift_table', 4),
(349, '2020_03_30_162029_create_user_shifts_table', 4),
(350, '2020_03_31_134558_add_shift_id_to_attendance_table', 4),
(351, '2020_11_05_105157_modify_todos_date_column_type', 4),
(352, '2020_11_11_174852_add_end_time_column_to_essentials_reminders_table', 4),
(353, '2020_11_26_170527_create_essentials_kb_table', 4),
(354, '2020_11_30_112615_create_essentials_kb_users_table', 4),
(355, '2021_02_12_185514_add_clock_in_location_to_essentials_attendances_table', 4),
(356, '2021_02_16_190203_add_essentials_module_indexing', 4),
(357, '2021_02_27_133448_add_columns_to_users_table', 4),
(358, '2021_03_04_174857_create_payroll_groups_table', 4),
(359, '2021_03_04_175025_create_payroll_group_transactions_table', 4),
(360, '2021_03_09_123914_add_auto_clockout_to_essentials_shifts', 4),
(361, '2021_06_17_121451_add_location_id_to_table', 4),
(362, '2021_09_28_091541_create_essentials_user_sales_targets_table', 4),
(363, '2018_10_10_110400_add_module_version_to_system_table', 5),
(364, '2018_10_10_122845_add_woocommerce_api_settings_to_business_table', 5),
(365, '2018_10_10_162041_add_woocommerce_category_id_to_categories_table', 5),
(366, '2018_10_11_173839_create_woocommerce_sync_logs_table', 5),
(367, '2018_10_16_123522_add_woocommerce_tax_rate_id_column_to_tax_rates_table', 5),
(368, '2018_10_23_111555_add_woocommerce_attr_id_column_to_variation_templates_table', 5),
(369, '2018_12_03_163945_add_woocommerce_permissions', 5),
(370, '2019_02_18_154414_change_woocommerce_sync_logs_table', 5),
(371, '2019_04_19_174129_add_disable_woocommerce_sync_column_to_products_table', 5),
(372, '2019_06_08_132440_add_woocommerce_wh_oc_secret_column_to_business_table', 5),
(373, '2019_10_01_171828_add_woocommerce_media_id_columns', 5),
(374, '2020_09_07_124952_add_woocommerce_skipped_orders_fields_to_business_table', 5),
(375, '2021_02_16_190608_add_woocommerce_module_indexing', 5),
(376, '2020_09_29_184909_add_product_catalogue_version', 6),
(377, '2019_07_07_093258_create_chart_of_accounts_table', 7),
(378, '2019_07_07_093648_create_journal_entries_table', 7),
(379, '2019_07_07_110645_create_payment_types_table', 7),
(380, '2021_08_23_175321_add_contact_and_location_id_to_journal_entries_table', 7),
(381, '2021_11_29_170819_add_business_id_to_chart_of_accounts_table', 7),
(382, '2022_01_17_202319_create_payment_details_table', 7),
(383, '2022_01_19_034231_create_countries_table', 7),
(384, '2022_02_01_031031_create_transfers_table', 7),
(385, '2022_02_03_215602_create_budgets_table', 7),
(386, '2022_02_08_113906_add_opening_balance_to_chart_of_accounts_table', 7),
(387, '2022_02_08_121045_add_currency_id_to_chart_of_accounts_table', 7),
(388, '2022_02_09_002406_add_payment_type_id_to_chart_of_accounts_table', 7),
(389, '2022_02_09_125328_create_account_detail_types_table', 7),
(390, '2022_02_09_223848_create_account_subtypes_table', 7),
(391, '2022_02_09_223849_add_account_subtype_id_and_detail_type_id_to_chart_of_accounts_table', 7),
(392, '2022_02_23_130555_add_journal_entry_id_to_transactions_table', 7),
(393, '2022_03_17_140457_add_reconcile_opening_balance_to_chart_of_accounts_table', 7),
(394, '2022_04_11_163625_populate_account_subtypes_table', 7),
(395, '2022_04_11_165143_populate_account_detail_types_table', 7),
(396, '2022_06_08_105942_create_branch_capital_table', 7),
(397, '2022_07_25_100234_change_payment_type_id_column_from_int_to_string_in_payment_details_table', 7),
(398, '2020_08_19_175842_add_asset_management_module_version_to_system_table', 8),
(399, '2020_08_20_114339_create_assets_table', 8),
(400, '2020_08_20_173031_create_asset_transactions_table', 8),
(401, '2020_08_21_180138_add_asset_settings_column_to_business_table', 8),
(402, '2021_10_29_110841_create_asset_warranties_table', 8),
(403, '2022_03_26_062215_create_asset_maintenances_table', 8),
(404, '2022_05_11_070711_add_maintenance_note_column_to_asset_maintenances_table', 8),
(405, '2019_11_12_163135_create_projects_table', 9),
(406, '2019_11_12_164431_create_project_members_table', 9),
(407, '2019_11_14_112230_create_project_tasks_table', 9),
(408, '2019_11_14_112258_create_project_task_members_table', 9),
(409, '2019_11_18_154617_create_project_task_comments_table', 9),
(410, '2019_11_19_134807_create_project_time_logs_table', 9),
(411, '2019_12_11_102549_add_more_fields_in_transactions_table', 9),
(412, '2019_12_11_102735_create_invoice_lines_table', 9),
(413, '2020_01_07_172852_add_project_permissions', 9),
(414, '2020_01_08_115422_add_project_module_version_to_system_table', 9),
(415, '2020_07_10_114514_set_location_id_on_existing_invoice', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(80, 'App\\User', 3),
(80, 'App\\User', 5),
(80, 'App\\User', 6),
(80, 'App\\User', 8),
(96, 'App\\User', 2),
(120, 'App\\User', 4),
(120, 'App\\User', 6),
(120, 'App\\User', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 3),
(2, 'App\\User', 2),
(4, 'App\\User', 5),
(4, 'App\\User', 8),
(5, 'App\\User', 4),
(5, 'App\\User', 7),
(6, 'App\\User', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multi_currency_settings`
--

CREATE TABLE `multi_currency_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `business_currency_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `exchange_rate` decimal(5,3) DEFAULT NULL COMMENT '1 Purchase/Sell currency = ? Base Currency',
  `type` enum('fixed','api') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `multi_currency_settings`
--

INSERT INTO `multi_currency_settings` (`id`, `business_id`, `business_currency_id`, `currency_id`, `exchange_rate`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 14, 124, 20.000, 'fixed', '2025-08-26 16:01:24', '2025-08-26 16:24:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `whatsapp_text` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  `bcc` varchar(191) DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(10, 1, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(11, 2, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(12, 2, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(13, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(14, 2, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(15, 2, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(16, 2, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(17, 2, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(18, 2, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(19, 2, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(20, 2, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_details`
--

CREATE TABLE `payment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `payment_type_id` varchar(11) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` int(11) DEFAULT NULL,
  `cheque_number` varchar(191) DEFAULT NULL,
  `receipt` varchar(191) DEFAULT NULL,
  `account_number` varchar(191) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `routing_code` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_types`
--

CREATE TABLE `payment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `system_name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_cash` tinyint(4) NOT NULL DEFAULT 0,
  `is_online` tinyint(4) NOT NULL DEFAULT 0,
  `is_system` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `unique_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payment_types`
--

INSERT INTO `payment_types` (`id`, `business_id`, `name`, `system_name`, `description`, `is_cash`, `is_online`, `is_system`, `active`, `position`, `options`, `unique_id`, `created_at`, `updated_at`) VALUES
(1, 0, 'Cash', NULL, NULL, 0, 0, 0, 1, NULL, NULL, NULL, '2025-08-26 00:00:00', '2025-08-26 00:00:00'),
(2, 0, 'Ecocash', NULL, 'ecocash', 0, 0, 0, 1, 1, NULL, NULL, '2025-08-26 00:00:00', '2025-08-26 00:00:00'),
(3, 0, 'Mpesa', NULL, 'Pay via Mpesa', 0, 0, 0, 1, NULL, NULL, NULL, '2025-08-26 00:00:00', '2025-08-26 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2025-08-27 00:16:19', NULL),
(2, 'direct_sell.access', 'web', '2025-08-27 00:16:19', NULL),
(3, 'product.opening_stock', 'web', '2025-08-27 00:16:22', '2025-08-27 00:16:22'),
(4, 'crud_all_bookings', 'web', '2025-08-27 00:16:23', '2025-08-27 00:16:23'),
(5, 'crud_own_bookings', 'web', '2025-08-27 00:16:23', '2025-08-27 00:16:23'),
(6, 'access_default_selling_price', 'web', '2025-08-27 00:16:24', '2025-08-27 00:16:24'),
(7, 'purchase.payments', 'web', '2025-08-27 00:16:25', '2025-08-27 00:16:25'),
(8, 'sell.payments', 'web', '2025-08-27 00:16:25', '2025-08-27 00:16:25'),
(9, 'edit_product_price_from_sale_screen', 'web', '2025-08-27 00:16:25', '2025-08-27 00:16:25'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2025-08-27 00:16:25', '2025-08-27 00:16:25'),
(11, 'roles.view', 'web', '2025-08-27 00:16:25', '2025-08-27 00:16:25'),
(12, 'roles.create', 'web', '2025-08-27 00:16:25', '2025-08-27 00:16:25'),
(13, 'roles.update', 'web', '2025-08-27 00:16:25', '2025-08-27 00:16:25'),
(14, 'roles.delete', 'web', '2025-08-27 00:16:25', '2025-08-27 00:16:25'),
(15, 'account.access', 'web', '2025-08-27 00:16:26', '2025-08-27 00:16:26'),
(16, 'discount.access', 'web', '2025-08-27 00:16:26', '2025-08-27 00:16:26'),
(17, 'view_purchase_price', 'web', '2025-08-27 00:16:28', '2025-08-27 00:16:28'),
(18, 'view_own_sell_only', 'web', '2025-08-27 00:16:28', '2025-08-27 00:16:28'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2025-08-27 00:16:29', '2025-08-27 00:16:29'),
(20, 'edit_product_price_from_pos_screen', 'web', '2025-08-27 00:16:29', '2025-08-27 00:16:29'),
(21, 'access_shipping', 'web', '2025-08-27 00:16:30', '2025-08-27 00:16:30'),
(22, 'purchase.update_status', 'web', '2025-08-27 00:16:30', '2025-08-27 00:16:30'),
(23, 'list_drafts', 'web', '2025-08-27 00:16:31', '2025-08-27 00:16:31'),
(24, 'list_quotations', 'web', '2025-08-27 00:16:31', '2025-08-27 00:16:31'),
(25, 'view_cash_register', 'web', '2025-08-27 00:16:35', '2025-08-27 00:16:35'),
(26, 'close_cash_register', 'web', '2025-08-27 00:16:35', '2025-08-27 00:16:35'),
(27, 'print_invoice', 'web', '2025-08-27 00:16:40', '2025-08-27 00:16:40'),
(28, 'user.view', 'web', '2025-08-27 00:16:48', NULL),
(29, 'user.create', 'web', '2025-08-27 00:16:48', NULL),
(30, 'user.update', 'web', '2025-08-27 00:16:48', NULL),
(31, 'user.delete', 'web', '2025-08-27 00:16:48', NULL),
(32, 'supplier.view', 'web', '2025-08-27 00:16:48', NULL),
(33, 'supplier.create', 'web', '2025-08-27 00:16:48', NULL),
(34, 'supplier.update', 'web', '2025-08-27 00:16:48', NULL),
(35, 'supplier.delete', 'web', '2025-08-27 00:16:48', NULL),
(36, 'customer.view', 'web', '2025-08-27 00:16:48', NULL),
(37, 'customer.create', 'web', '2025-08-27 00:16:48', NULL),
(38, 'customer.update', 'web', '2025-08-27 00:16:48', NULL),
(39, 'customer.delete', 'web', '2025-08-27 00:16:48', NULL),
(40, 'product.view', 'web', '2025-08-27 00:16:48', NULL),
(41, 'product.create', 'web', '2025-08-27 00:16:48', NULL),
(42, 'product.update', 'web', '2025-08-27 00:16:48', NULL),
(43, 'product.delete', 'web', '2025-08-27 00:16:48', NULL),
(44, 'purchase.view', 'web', '2025-08-27 00:16:48', NULL),
(45, 'purchase.create', 'web', '2025-08-27 00:16:48', NULL),
(46, 'purchase.update', 'web', '2025-08-27 00:16:48', NULL),
(47, 'purchase.delete', 'web', '2025-08-27 00:16:48', NULL),
(48, 'sell.view', 'web', '2025-08-27 00:16:48', NULL),
(49, 'sell.create', 'web', '2025-08-27 00:16:48', NULL),
(50, 'sell.update', 'web', '2025-08-27 00:16:48', NULL),
(51, 'sell.delete', 'web', '2025-08-27 00:16:48', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2025-08-27 00:16:48', NULL),
(53, 'contacts_report.view', 'web', '2025-08-27 00:16:48', NULL),
(54, 'stock_report.view', 'web', '2025-08-27 00:16:48', NULL),
(55, 'tax_report.view', 'web', '2025-08-27 00:16:48', NULL),
(56, 'trending_product_report.view', 'web', '2025-08-27 00:16:48', NULL),
(57, 'register_report.view', 'web', '2025-08-27 00:16:48', NULL),
(58, 'sales_representative.view', 'web', '2025-08-27 00:16:48', NULL),
(59, 'expense_report.view', 'web', '2025-08-27 00:16:48', NULL),
(60, 'business_settings.access', 'web', '2025-08-27 00:16:48', NULL),
(61, 'barcode_settings.access', 'web', '2025-08-27 00:16:48', NULL),
(62, 'invoice_settings.access', 'web', '2025-08-27 00:16:48', NULL),
(63, 'brand.view', 'web', '2025-08-27 00:16:48', NULL),
(64, 'brand.create', 'web', '2025-08-27 00:16:48', NULL),
(65, 'brand.update', 'web', '2025-08-27 00:16:48', NULL),
(66, 'brand.delete', 'web', '2025-08-27 00:16:48', NULL),
(67, 'tax_rate.view', 'web', '2025-08-27 00:16:48', NULL),
(68, 'tax_rate.create', 'web', '2025-08-27 00:16:48', NULL),
(69, 'tax_rate.update', 'web', '2025-08-27 00:16:48', NULL),
(70, 'tax_rate.delete', 'web', '2025-08-27 00:16:48', NULL),
(71, 'unit.view', 'web', '2025-08-27 00:16:48', NULL),
(72, 'unit.create', 'web', '2025-08-27 00:16:48', NULL),
(73, 'unit.update', 'web', '2025-08-27 00:16:48', NULL),
(74, 'unit.delete', 'web', '2025-08-27 00:16:48', NULL),
(75, 'category.view', 'web', '2025-08-27 00:16:48', NULL),
(76, 'category.create', 'web', '2025-08-27 00:16:48', NULL),
(77, 'category.update', 'web', '2025-08-27 00:16:48', NULL),
(78, 'category.delete', 'web', '2025-08-27 00:16:48', NULL),
(79, 'expense.access', 'web', '2025-08-27 00:16:48', NULL),
(80, 'access_all_locations', 'web', '2025-08-27 00:16:48', NULL),
(81, 'dashboard.data', 'web', '2025-08-27 00:16:48', NULL),
(82, 'location.1', 'web', '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(83, 'essentials.create_message', 'web', '2025-08-26 16:40:05', '2025-08-26 16:40:05'),
(84, 'essentials.view_message', 'web', '2025-08-26 16:40:05', '2025-08-26 16:40:05'),
(85, 'essentials.approve_leave', 'web', '2025-08-26 16:40:05', '2025-08-26 16:40:05'),
(86, 'essentials.assign_todos', 'web', '2025-08-26 16:40:06', '2025-08-26 16:40:06'),
(87, 'essentials.add_allowance_and_deduction', 'web', '2025-08-26 16:40:06', '2025-08-26 16:40:06'),
(88, 'woocommerce.syc_categories', 'web', '2025-08-26 16:42:45', '2025-08-26 16:42:45'),
(89, 'woocommerce.sync_products', 'web', '2025-08-26 16:42:45', '2025-08-26 16:42:45'),
(90, 'woocommerce.sync_orders', 'web', '2025-08-26 16:42:45', '2025-08-26 16:42:45'),
(91, 'woocommerce.map_tax_rates', 'web', '2025-08-26 16:42:45', '2025-08-26 16:42:45'),
(92, 'woocommerce.access_woocommerce_api_settings', 'web', '2025-08-26 16:42:45', '2025-08-26 16:42:45'),
(93, 'project.create_project', 'web', '2025-08-26 17:00:38', '2025-08-26 17:00:38'),
(94, 'project.edit_project', 'web', '2025-08-26 17:00:38', '2025-08-26 17:00:38'),
(95, 'project.delete_project', 'web', '2025-08-26 17:00:38', '2025-08-26 17:00:38'),
(96, 'location.2', 'web', '2025-08-26 19:46:04', '2025-08-26 19:46:04'),
(97, 'essentials.crud_all_leave', 'web', '2025-08-27 15:00:07', '2025-08-27 15:00:07'),
(98, 'view_export_buttons', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(99, 'edit_purchase_payment', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(100, 'delete_purchase_payment', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(101, 'edit_pos_payment', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(102, 'disable_draft', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(103, 'disable_quotation', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(104, 'direct_sell.update', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(105, 'edit_sell_payment', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(106, 'delete_sell_payment', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(107, 'expense.add', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(108, 'expense.edit', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(109, 'expense.delete', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(110, 'edit_account_transaction', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(111, 'delete_account_transaction', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(112, 'asset.view', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(113, 'asset.create', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(114, 'asset.update', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(115, 'asset.delete', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(116, 'direct_sell.view', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(117, 'all_expense.access', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(118, 'asset.view_all_maintenance', 'web', '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(119, 'direct_sell.delete', 'web', '2025-10-10 19:03:37', '2025-10-10 19:03:37'),
(120, 'location.3', 'web', '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(121, 'view_due_sells_only', 'web', '2026-02-01 09:01:08', '2026-02-01 09:01:08'),
(122, 'view_product_stock_value', 'web', '2026-02-01 09:01:08', '2026-02-01 09:01:08'),
(123, 'supplier.view_own', 'web', '2026-02-01 09:01:08', '2026-02-01 09:01:08'),
(124, 'view_own_purchase', 'web', '2026-02-01 09:01:08', '2026-02-01 09:01:08'),
(125, 'quotation.view_own', 'web', '2026-02-01 09:01:08', '2026-02-01 09:01:08'),
(126, 'disable_pay_checkout', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(127, 'disable_express_checkout', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(128, 'disable_discount', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(129, 'disable_suspend_sale', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(130, 'disable_credit_sale', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(131, 'disable_card', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(132, 'view_paid_sells_only', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(133, 'view_partial_sells_only', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(134, 'view_overdue_sells_only', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(135, 'view_commission_agent_sell', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(136, 'access_sell_return', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(137, 'access_own_sell_return', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(138, 'edit_invoice_number', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(139, 'customer.view_own', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48'),
(140, 'customer_irrespective_of_sell', 'web', '2026-02-01 09:28:48', '2026-02-01 09:28:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pjt_invoice_lines`
--

CREATE TABLE `pjt_invoice_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `task` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `rate` decimal(22,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `total` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pjt_projects`
--

CREATE TABLE `pjt_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `status` enum('not_started','in_progress','on_hold','cancelled','completed') NOT NULL,
  `lead_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pjt_project_members`
--

CREATE TABLE `pjt_project_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pjt_project_tasks`
--

CREATE TABLE `pjt_project_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `task_id` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `priority` enum('low','medium','high','urgent') NOT NULL DEFAULT 'low',
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `status` enum('completed','not_started','in_progress','on_hold','cancelled') NOT NULL DEFAULT 'not_started',
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pjt_project_task_comments`
--

CREATE TABLE `pjt_project_task_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_task_id` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `commented_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pjt_project_task_members`
--

CREATE TABLE `pjt_project_task_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pjt_project_time_logs`
--

CREATE TABLE `pjt_project_time_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `project_task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `connection_type` enum('network','windows','linux') NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `port` varchar(191) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `secondary_unit_id` int(11) DEFAULT NULL,
  `sub_unit_ids` text DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) DEFAULT NULL,
  `product_custom_field1` varchar(191) DEFAULT NULL,
  `product_custom_field2` varchar(191) DEFAULT NULL,
  `product_custom_field3` varchar(191) DEFAULT NULL,
  `product_custom_field4` varchar(191) DEFAULT NULL,
  `product_custom_field5` varchar(191) DEFAULT NULL,
  `product_custom_field6` varchar(191) DEFAULT NULL,
  `product_custom_field7` varchar(191) DEFAULT NULL,
  `product_custom_field8` varchar(191) DEFAULT NULL,
  `product_custom_field9` varchar(191) DEFAULT NULL,
  `product_custom_field10` varchar(191) DEFAULT NULL,
  `product_custom_field11` varchar(191) DEFAULT NULL,
  `product_custom_field12` varchar(191) DEFAULT NULL,
  `product_custom_field13` varchar(191) DEFAULT NULL,
  `product_custom_field14` varchar(191) DEFAULT NULL,
  `product_custom_field15` varchar(191) DEFAULT NULL,
  `product_custom_field16` varchar(191) DEFAULT NULL,
  `product_custom_field17` varchar(191) DEFAULT NULL,
  `product_custom_field18` varchar(191) DEFAULT NULL,
  `product_custom_field19` varchar(191) DEFAULT NULL,
  `product_custom_field20` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_product_id` int(11) DEFAULT NULL,
  `woocommerce_disable_sync` tinyint(1) NOT NULL DEFAULT 0,
  `preparation_time_in_minutes` int(11) DEFAULT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `product_custom_field5`, `product_custom_field6`, `product_custom_field7`, `product_custom_field8`, `product_custom_field9`, `product_custom_field10`, `product_custom_field11`, `product_custom_field12`, `product_custom_field13`, `product_custom_field14`, `product_custom_field15`, `product_custom_field16`, `product_custom_field17`, `product_custom_field18`, `product_custom_field19`, `product_custom_field20`, `image`, `woocommerce_media_id`, `product_description`, `created_by`, `woocommerce_product_id`, `woocommerce_disable_sync`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(0, 'Genesis', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'exclusive', 1, 12.0000, '1245', 'EAN13', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1771296013_9b1b3506-c48c-4564-9b47-f42df5318039.webp', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2026-02-17 02:35:56', '2026-02-17 02:42:21'),
(1, 'PRUEBA', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'exclusive', 1, NULL, '0001', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1756241266_descarga (11).jpg', NULL, '<p>Llevaban dando pistas desde Poco unos d&iacute;as y el nuevo Poco F7 no nos ha defraudado. Hay nuevo terminal de Poco de referencia y nos ofrece todo lo que siempre ha caracterizado a esta familia de Xiaomi que es un aut&eacute;ntico azote para la gama alta cl&aacute;sica y uno de los terminales que nunca nos cansamos de recomendar en Xataka.</p>\r\n<p>El&nbsp;<strong>Poco F7</strong>&nbsp;afina su dise&ntilde;o sin perder la identidad que tan marcada nos deja siempre: potencia, bater&iacute;a, c&aacute;mara correcta y ante todo, una ficha t&eacute;cnica que tiene muy pocas alternativas si lo que buscamos es&nbsp;<strong>el mejor smartphone potente en relaci&oacute;n calidad-precio</strong>. S&iacute;, el Poco F7 lo ha vuelto a hacer.</p>\r\n<div class=\"toc-container article-asset-normal\"><details>\r\n<summary class=\"toc-header \"><span class=\"toc-heading\">&nbsp;&Iacute;ndice de Contenidos (8)</span></summary>\r\n</details>\r\n<div class=\"toc-list-wrap \">\r\n<div class=\"toc-list-item\">\r\n<ul class=\"toc-list\">\r\n<li class=\"toc-item\">&nbsp;</li>\r\n<li class=\"toc-item\">&nbsp;</li>\r\n<li class=\"toc-item\">&nbsp;</li>\r\n<li class=\"toc-item\">&nbsp;</li>\r\n<li class=\"toc-sub-item\">&nbsp;</li>\r\n<li class=\"toc-item\">&nbsp;</li>\r\n<li class=\"toc-item\">&nbsp;</li>\r\n<li class=\"toc-item\">&nbsp;</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<h2 id=\"ficha-tecnica-poco-f7-1\" class=\"toc-enabled\">Ficha t&eacute;cnica del Poco F7</h2>\r\n<div class=\"article-asset-table article-asset-normal\">\r\n<div class=\"asset-content\">\r\n<table class=\"tabla-datos\">\r\n<thead>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>&nbsp;</p>\r\n</th>\r\n<th class=\"align-left\">\r\n<p>poco f7</p>\r\n</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>dimensiones y peso</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p>163,1 x 77,9 x 8,2 mm</p>\r\n<p>215,7 gramos</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>pantalla</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p>AMOLED de 6,83 pulgadas</p>\r\n<p>Resoluci&oacute;n 1,5k (2.772 x 1.280 p&iacute;xeles)</p>\r\n<p>447 ppp</p>\r\n<p>Tasa de refresco: 120 Hz</p>\r\n<p>Muestreo t&aacute;ctil: 480 Hz/2.560 Hz</p>\r\n<p>Brillo HBM: 1.700 nits</p>\r\n<p>Brillo pico: 3.200 nits (25% p&iacute;xeles pantalla)</p>\r\n<p>DCI-P3</p>\r\n<p>PWM Dimming: 3.840 Hz</p>\r\n<p>Gorilla Glass 7i</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>procesador</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p>Snapdragon 8s Gen 4</p>\r\n<p>GPU Adreno 825</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>memoria ram</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p>12 GB LPDDR5x</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>almacenamiento interno</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p>256/512 GB UFS 4.1</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>c&aacute;mara traserA</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p>Principal 50 MP, f/1.5, OIS</p>\r\n<p>Gran angular 8 MP f/2.2</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>C&Aacute;MARA DELANTERA</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p>20 MP</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>BATER&Iacute;A</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p>6.500 mAh</p>\r\n<p>Carga r&aacute;pida 90W</p>\r\n<p>Carga inversa 22,5W</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p>SISTEMA OPERATIVO</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p>HyperOS 2</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>', 1, NULL, 0, NULL, NULL, 0, 0, '2025-08-26 16:03:21', '2025-08-26 19:59:40'),
(2, 'PRUEBA 2', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'exclusive', 1, NULL, '0002', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1756241318_D_NQ_NP_933281-MBO83830715590_042025-O.webp', NULL, '<h1 class=\"post-title-featured\">Poco F7 Ultra, an&aacute;lisis: si el Poco de siempre es ahora mejor, el &eacute;xito est&aacute; asegurado</h1>\r\n<section class=\"post-entradilla\">\r\n<div class=\"post-entradilla-inner\">\r\n<ul>\r\n<li>\r\n<h2>El Poco m&aacute;s potente de siempre estrena apellido Ultra. Y cumple con sus promesas</h2>\r\n</li>\r\n<li>\r\n<h2>Las c&aacute;maras, sin llegar al nivel de la gama alta, ya no son un bache insalvable</h2>\r\n</li>\r\n</ul>\r\n<p data-mrf-recirculation=\"Article links\">El nuevo&nbsp;<strong>Poco F7 Ultra</strong>, un paso m&aacute;s adelante en la familia m&aacute;s excelsa del fabricante, cumple con ambas premisas. Pero en el caso de la primera, la de ofrecer siempre lo mismo, no es del todo correcta. El nuevo Poco F7, como su apellido Ultra ya nos da a entender, va mucho m&aacute;s all&aacute; en busca de mejorar justo donde los Poco F siempre han fallado:&nbsp;<strong>la c&aacute;mara de fotos</strong>. &iquest;Ser&aacute; &eacute;sta por fin el Poco definitivo?</p>\r\n<h2>Ficha t&eacute;cnica del Poco F7 Ultra</h2>\r\n<div class=\"article-asset-table article-asset-normal\">\r\n<div class=\"asset-content\">\r\n<table class=\"tabla-datos\">\r\n<thead>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">&nbsp;</p>\r\n</th>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">poco f7 ultra</p>\r\n</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">PANTALLA</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">AMOLED de 6,67 pulgadas</p>\r\n<p data-mrf-recirculation=\"Article links\">Resoluci&oacute;n 2K (3.200 x 1.440)</p>\r\n<p data-mrf-recirculation=\"Article links\">Tasa de refresco de 120 Hz</p>\r\n<p data-mrf-recirculation=\"Article links\">3.200 nits de brillo pico</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">DIMENSIONES Y PESO</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">160,26 x 74,95 x 8,39 mm</p>\r\n<p data-mrf-recirculation=\"Article links\">212 gramos</p>\r\n<p data-mrf-recirculation=\"Article links\">IP68</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">PROCESADOR</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">Snapdragon 8 Elite</p>\r\n<p data-mrf-recirculation=\"Article links\">VisionBoost D7</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">RAM y almacenamiento</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">12/16 GB LPDDR5X</p>\r\n<p data-mrf-recirculation=\"Article links\">254 / 512 GB UFS 4.1</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">C&Aacute;MARA FRONTAL</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">32 MP, &nbsp;f/2.0</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">C&Aacute;MARA TRASERA</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">Principal: 50 MP, f/1.6, OIS</p>\r\n<p data-mrf-recirculation=\"Article links\">Gran angular: 32 MP, f/2.2</p>\r\n<p data-mrf-recirculation=\"Article links\">Telefoto: 50 MP, f/2.0, zoom 2,5x, OIS</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">BATER&Iacute;A</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">5.300 mAh</p>\r\n<p data-mrf-recirculation=\"Article links\">Carga r&aacute;pida 120 W</p>\r\n<p data-mrf-recirculation=\"Article links\">Carga inal&aacute;mbrica 50 W</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">SISTEMA OPERATIVO</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">Android 15</p>\r\n<p data-mrf-recirculation=\"Article links\">HyperOS 2</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">CONECTIVIDAD</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">5G</p>\r\n<p data-mrf-recirculation=\"Article links\">WiFi 7</p>\r\n<p data-mrf-recirculation=\"Article links\">Bluetooth 6.0</p>\r\n<p data-mrf-recirculation=\"Article links\">NFC</p>\r\n<p data-mrf-recirculation=\"Article links\">IR</p>\r\n<p data-mrf-recirculation=\"Article links\">USB-C 3.2</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<th class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">OTROS</p>\r\n</th>\r\n<td class=\"align-left\">\r\n<p data-mrf-recirculation=\"Article links\">Lector de huellas ultras&oacute;nico bajo la pantalla</p>\r\n<p data-mrf-recirculation=\"Article links\">Altavoces est&eacute;reo</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 1, NULL, 0, NULL, NULL, 0, 0, '2025-08-26 16:48:38', '2025-08-27 14:08:19'),
(3, 'PRODUCTO 3', 1, 'single', 1, NULL, NULL, 1, 2, NULL, NULL, 'exclusive', 1, NULL, '0003', 'C128', NULL, NULL, 1, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1756317667_descarga.jfif', NULL, '<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">\r\n<div class=\"subHeadingRow ProductCardNormalGrid__subHeadingRow__1WsQN\"><span style=\"color: #169179;\"><strong>14&rdquo; - 35,56 cm</strong></span></div>\r\n</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">\r\n<h2>ASUS Zenbook S14 (UX5406);<br />Copilot+ PC</h2>\r\n</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC ProductCardNormalGrid__viewBoxBv__2Dhl-\">\r\n<div class=\"bazaaInlineRating themeWhite ProductCardNormalGrid__bazaaInlineRating__3SlD_\" data-bv-show=\"inline_rating\" data-bv-seo=\"false\" data-bv-product-id=\"ASUS_M1_25385_P\" data-bv-ready=\"true\">\r\n<div class=\"\">\r\n<div id=\"bcbc557c-57dd-4ed3-81f8-3f8dd05f7d08\" class=\"bv_main_container bv_hover bv_inline_rating_container_left\">\r\n<div class=\"bv_stars_component_container\" aria-hidden=\"true\">\r\n<div class=\"bv_stars_button_container\">&nbsp;</div>\r\n</div>\r\n<div class=\"bv_sub_container\">\r\n<div class=\"bv_averageRating_component_container\" aria-hidden=\"true\">\r\n<div class=\"bv_text\">4.6</div>\r\n</div>\r\n<div class=\"bv_numReviews_component_container\" aria-hidden=\"true\">\r\n<div class=\"bv_text\">(120)</div>\r\n</div>\r\n</div>\r\n<div class=\"bv-off-screen\">4.6 de 5 estrellas. 120 rese&ntilde;as</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">\r\n<div class=\"hrTop ProductCardNormalGrid__hrTop__jCEL9\"><hr class=\"ProductCardNormalGrid__hrBehindDiscount__36pLX\" /></div>\r\n</div>\r\n<div class=\"cardSafetyBox ProductCardNormalGrid__viewBox__1JSHC\">\r\n<div class=\"cardSafety ProductCardNormalGrid__cardSafetyContent__2gilF\">Precio de la ASUS store</div>\r\n<div class=\"ProductCardNormalGrid__cardSafetyInfo__1zuVD\">\r\n<div class=\"ProductCardNormalGrid__cardSafetyIconBox__3q2ks\" tabindex=\"0\" role=\"button\" aria-expanded=\"false\" aria-label=\"toolTip\" aria-describedby=\"toolTip\">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">\r\n<div class=\"priceWrap ProductCardNormalGrid__priceWrap__3XQGB\">\r\n<div class=\"ProductCardNormalGrid__price__1iXqP ProductCardNormalGrid__priceDiscount__3DUH_\">1.699,00 &euro;</div>\r\n</div>\r\n</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">\r\n<div class=\"WrapPriceDiscount ProductCardNormalGrid__priceWrap__3XQGB ProductCardNormalGrid__priceWrapFull__BE0K0\">\r\n<div class=\"ProductCardNormalGrid__regularPrice__3AoJF\">1.799,00 &euro;</div>\r\n<div class=\"ProductCardNormalGrid__save__3_kgk\">Ahorras 100,00 &euro;</div>\r\n</div>\r\n</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">\r\n<div class=\"cardSafety2 ProductCardNormalGrid__cardSafety2__2hfS1\">Este precio podr&iacute;a no referirse a las especificaciones de abajo.</div>\r\n</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">&nbsp;</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">\r\n<div class=\"hrBottom ProductCardNormalGrid__hrBottom__clTwZ\"><hr class=\"ProductCardNormalGrid__hrAfterDiscount__1tLv6\" /></div>\r\n</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">&nbsp;</div>\r\n<div class=\"ProductCardNormalGrid__viewBox__1JSHC\">&nbsp;</div>\r\n<div class=\"featureDescriptionRow ProductCardNormalGrid__featureDescriptionRow__1Ye38\">\r\n<div class=\"itemModelSpec ProductCardNormalGrid__itemModelSpec__tWOz9\">\r\n<ul>\r\n<li>Windows 11 Home: ASUS recomienda Windows 11 Pro para empresas</li>\r\n<li>Fino y ligero: 1,1 cm, 1,2 kg</li>\r\n<li>Cer&aacute;mica de alta tecnolog&iacute;a: CeraluminumTM</li>\r\n<li>Hasta Intel<sup>&reg;</sup>&nbsp;Core&trade; Procesador Ultra 7 (Serie 2)</li>\r\n<li>Bater&iacute;a de larga duraci&oacute;n de 72 Wh</li>\r\n<li>Pantalla OLED 3K 16:10 con 4 altavoces</li>\r\n<li>Hasta 32 GB de RAM LPDDR5x 8533 MHz</li>\r\n<li>Hasta 1 TB de SSD PCIe<sup>&reg;</sup>&nbsp;Gen 4</li>\r\n<li>WiFi 7 (802.11be)</li>\r\n<li>Puertos de E/S completos con 2 ThunderboltTM 4 USB-CTM</li>\r\n</ul>\r\n</div>\r\n</div>', 1, NULL, 0, NULL, NULL, 0, 0, '2025-08-27 14:01:07', '2025-08-27 15:12:58'),
(4, '7UP 500 ML', 1, 'single', 1, NULL, NULL, 13, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0004', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(5, 'APPLE PIE', 1, 'single', 1, NULL, NULL, 3, 6, NULL, NULL, 'inclusive', 1, 0.0000, '0005', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(6, 'BARS KIDS CHEESE', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0006', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(7, 'BARS KIDS CLASSIC', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0007', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(8, 'BARS KING Doble XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0008', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(9, 'BARS KING XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0009', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(10, 'BOLIVIANITA', 1, 'single', 1, NULL, NULL, 1, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0010', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(11, 'BOTELLA DE GIN', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0011', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(12, 'BROWNIE', 1, 'single', 1, NULL, NULL, 3, 6, NULL, NULL, 'inclusive', 1, 0.0000, '0012', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(13, 'BTL BACONNAISE DOBLE XL', 1, 'single', 1, NULL, NULL, 1, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0013', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(14, 'BTL BACONNAISE XL', 1, 'single', 1, NULL, NULL, 1, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0014', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(15, 'BUDWEISER', 1, 'single', 1, NULL, NULL, 9, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0015', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(16, 'CAIPIRINHA', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0016', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(17, 'CERVEZA BOTELLIN HUARI LAGGER', 1, 'single', 1, NULL, NULL, 10, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0017', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(18, 'CERVEZA BOTELLIN HUARI MIEL', 1, 'single', 1, NULL, NULL, 10, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0018', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(19, 'CHEESE BACON Doble XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0019', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(20, 'CHEESE BACON XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0020', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(21, 'CHOP DE CERVEZA PACEÑA', 1, 'single', 1, NULL, NULL, 11, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0021', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(22, 'CLASIC MAN XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0022', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(23, 'CLASSIC MAN Doble XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0023', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(24, 'COPA CHAMPIONS', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0024', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(25, 'COPA LIBERTADORES', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0025', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(26, 'DALQUIRI DE FRUTOS ROJOS', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0026', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(27, 'FERNET+HIELO+REFRESCO', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0027', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(28, 'GUARANA 500 ML', 1, 'single', 1, NULL, NULL, 1, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0028', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(29, 'HAWAIAN KICK DOBLE XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0029', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(30, 'HAWAIAN KICK XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0030', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(31, 'HEART ATTACK Doble XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0031', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(32, 'HEART ATTACK XL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0032', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(33, 'K.O.', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0033', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(34, 'MARADONA', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0034', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(35, 'MOJITO', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0035', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(36, 'PAPAS FRITAS - C/ORÉGANO', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0036', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(37, 'PAPAS FRITAS - CLÁSICAS', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0037', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(38, 'PAPAS FRITAS WILD STYLE - CARNÍVORA', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0038', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(39, 'PAPAS FRITAS WILD STYLE - NORMAL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0039', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(40, 'PEPSI 500 ML', 1, 'single', 1, NULL, NULL, 12, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0040', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(41, 'PIÑA COLADA', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0041', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(42, 'PORCION DE PAPAS', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0042', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(43, 'PROMO S/POLLO', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0043', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(44, 'RON+HIELO+REFRESCO', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0044', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(45, 'SALCHIBARS', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0045', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(46, 'SINGANI+HIELO+REFRESCO', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0046', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(47, 'STRIPPES 12 UNIDADES', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0047', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(48, 'STRIPPES 3 UNIDADES', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0048', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(49, 'STRIPPES 6 UNIDADES', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0049', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(50, 'TANDA DE PENALTIS', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0050', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(51, 'TOUCHDOWN', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0051', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(52, 'VASO DE FERNET', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0052', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(53, 'VASO DE GIN', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0053', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(54, 'VASO DE RON', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0054', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(55, 'VASO DE SINGANI', 1, 'single', 1, NULL, NULL, 3, 1, NULL, NULL, 'inclusive', 1, 0.0000, '0055', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(56, 'WILD STYLES CARNIVORA', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0056', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(57, 'WILD STYLES NORMAL', 1, 'single', 1, NULL, NULL, 3, 2, NULL, NULL, 'inclusive', 1, 0.0000, '0057', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 0, NULL, NULL, 0, 0, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(58, 'COXINHA COPACOL', 2, 'single', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891527000474', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770316450_1000028070.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:34:10'),
(59, 'COXA DORSAL BELLO', 2, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7898946613575', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770316078_1000028038.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:27:58'),
(60, 'COXA E SOBRECOXA BELLO', 2, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7898934113940', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770316224_1000028050.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:30:24'),
(61, 'COXA SOBRE COXA SEARA', 2, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7894904795253', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770316352_1000028061.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:32:32'),
(62, 'SALSICHA BELLO', 2, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '0062', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(63, 'TOSCANA LINGUIÇA', 2, 'single', 2, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7892696839926', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(64, 'RACAO VITAMAX', 2, 'single', 2, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, '0064', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119498_vittamax-10.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-03 07:51:38'),
(65, 'ALHO', 2, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7893069322540', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066395_ajo.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:06:35'),
(66, 'BATATA ARINOSA', 2, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7894264429638', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069007_papa arinosa.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:50:07'),
(67, 'BATATA OLANDESA', 2, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7890497929020', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069084_BATATA ARINOSA.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:51:24'),
(68, 'BETERRABA', 2, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7893302251286', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069353_romolacha.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:55:53'),
(69, 'CEBOLA', 2, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7892331265592', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072813_cebolla.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 18:53:33'),
(70, 'CENOURA', 2, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7895567439607', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072878_CENOURA.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 18:54:38'),
(71, 'LIMAO', 2, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7894314469454', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770834738_1000034407.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-11 14:32:18'),
(72, 'TOMATE', 2, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7896891046462', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(73, 'YUCA', 2, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7896260433626', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129915_yuca.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-03 10:45:15'),
(74, '51', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896002100014', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770061286_51 trago.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 15:42:22'),
(75, '7BELA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0075', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770061499_7 belo.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 15:44:59'),
(76, 'ACERO INOXIDABLE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '6942001312109', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770061913_bombril girasol.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 15:51:53'),
(77, 'ACETONA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896902208469', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770062067_sem acetona.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 15:54:27'),
(78, 'AGUA COM GAS LBR', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897520800059', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770062619_AGUA LBR.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 16:03:39'),
(79, 'AGUA MINERAL  MARAJÁ', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897417400997', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770063061_AGUA MARAJA 1.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 16:11:01'),
(80, 'AGUA OXIGENADA  40', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897534833302', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770063160_AGUA OXIGENADA 40.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 16:12:40'),
(81, 'AGUA OXIGENADA 30', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897534833296', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770063377_ÁGUA OXIGENADA 30}.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 16:16:17'),
(82, 'AGUA POR DO SOL CON GAS 1,5L', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898902479115', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770063533_AGUA POR DO SOL CON GAS 1,5.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 16:18:53'),
(83, 'AGUA PORDO SOL SEM GAS 1,5L', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898902479108', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770063699_AGUA PORDO SOL SEM GAS 1,5L.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 16:21:39'),
(84, 'ALBANY', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7897664171701', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770065529_ALBANHY CELESTE.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 16:52:09'),
(85, 'ALBANY', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7908324400120', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770065597_ALBANHY VERDE CLAFRO.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 16:53:17'),
(86, 'ALBANY', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '789766417175', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770065025_ALBANY NARAJA Y NEGRO.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 16:43:45'),
(87, 'ARCOR', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898142863774', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770067360_ARCOR.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:22:40'),
(88, 'ARISCO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891700206921', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770067404_ARISCO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:23:24'),
(89, 'AZEITE CASTELO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898922618099', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068094_AZEITE CASTELO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:34:54'),
(90, 'azucar itamarati', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896433800392', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068461_azucar itamarati.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:41:01'),
(91, 'BACON TORREZNO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400353', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068736_BACON TORREZNO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:45:36'),
(92, 'BAIANINHA 90ml', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896092501302', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068809_BAIANINHA.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 17:46:49'),
(93, 'BOM BRIL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891022868036', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070502_BOM BRIL.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 18:15:02'),
(94, 'BOZZANO 72', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891350032741', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070765_bozzano.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 18:19:25'),
(95, 'BOZZANO 72', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891350032406', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070844_BOZZANO 72 PLOMO.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 18:20:44'),
(96, 'BOZZONO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891350037807', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070890_BOZZONO 72 NEGRO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 18:21:30'),
(97, 'BOZZONO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891350032857', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070940_BOZZONO NARAJA.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 18:22:20'),
(98, 'CALABRESA UNIDADE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0098', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(99, 'CAPRICCHE CHOCOLATE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898657830926', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072461_CAPRICCHE CHOCOLATE.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 18:47:41'),
(100, 'CASA FLOR', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896440504047', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072627_CASA FLOR CAFE.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 18:50:27'),
(101, 'CHOCOLATTO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896045115365', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073511_CHOCOLATTO.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 19:05:11'),
(102, 'CLAYBOM GRANDE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891515901059', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073869_CLAYBOM GRANDE.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 19:11:09'),
(103, 'CLAYBOM 250', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891515901066', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073913_claybom matequilla.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 19:11:53'),
(105, 'CORETON', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896000705969', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770223325_1000027219.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-04 12:42:05'),
(106, 'CORETON', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896000705952', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770223493_1000027220.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-04 12:44:53'),
(107, 'CORETON', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896000706010', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770208866_1000027111.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-04 08:41:06');
INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `product_custom_field5`, `product_custom_field6`, `product_custom_field7`, `product_custom_field8`, `product_custom_field9`, `product_custom_field10`, `product_custom_field11`, `product_custom_field12`, `product_custom_field13`, `product_custom_field14`, `product_custom_field15`, `product_custom_field16`, `product_custom_field17`, `product_custom_field18`, `product_custom_field19`, `product_custom_field20`, `image`, `woocommerce_media_id`, `product_description`, `created_by`, `woocommerce_product_id`, `woocommerce_disable_sync`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(108, 'COSTELINHA DE TILAPIA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891527069969', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770223655_1000027221.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-04 12:47:35'),
(109, 'COTON BELL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '6972841050282', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770295567_1000027739.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 08:46:07'),
(110, 'CREME CREMOSAO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7908545601351', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770316783_1000027972.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:39:43'),
(111, 'DALE NAPOLITANO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '4908135601399', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770317326_1000028113.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:48:46'),
(112, 'DEL VALLE KAPO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7894900603705', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770317844_1000028136.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:57:24'),
(113, 'DELICIA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7894904271535', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770317895_1000028139.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:58:15'),
(114, 'DESINFECTANTE POLITRIZ', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898575690794', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770317997_1000028149.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:59:57'),
(115, 'DESINFECTANTE POLITRIZ', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898575690800', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770317940_1000028144.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 14:59:00'),
(116, 'DIFUSOR', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898586615328', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770318223_1000028153.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 15:03:43'),
(117, 'DIFUSOR', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898586615366', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770318277_1000028154.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 15:04:37'),
(118, 'DIPERONA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898133131011', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770318319_1000028159.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 15:05:19'),
(119, 'DOWNY', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7500435250603', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770319700_1000028179.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 15:28:20'),
(120, 'DOWNY', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7506339389876', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770321009_1000028218.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 15:50:10'),
(121, 'EL SEVE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0121', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770321523_1000028229.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 15:58:43'),
(122, 'ELSEVE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0122', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(123, 'ELSEVE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7899706164375', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(124, 'ELSEVE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0124', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(125, 'ELSEVE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7899706188302', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(126, 'ERVA VOCE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7890519251511', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322089_1000028254.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 16:08:09'),
(127, 'FANTA LARANJA LATA 350ML', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '2860900030396', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152252_falata 350.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-03 16:57:32'),
(128, 'FANTA UVA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7894900050394', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322715_1000028290.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 16:18:35'),
(129, 'FARINHA DE TRIGO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896279601375', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322979_1000028294.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 16:22:59'),
(130, 'FILEZINHO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898641047040', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770323139_1000028302.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 16:25:39'),
(131, 'FLOCOS IMPAL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7908545601382', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770323241_1000028304.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 16:27:21'),
(132, 'FLOR DE YPE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896098902226', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770323673_1000028321.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 16:34:33'),
(133, 'FLOR DE YPE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '789698902264', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326408_1000028405.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 17:20:08'),
(134, 'FLOR DE YPE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896098902219', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326549_1000028406.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 17:22:29'),
(135, 'FLOR DE YPE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896098902233', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326517_1000028407.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 17:21:57'),
(136, 'FOR DE YPE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896098902264', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770323778_1000028323.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 16:36:18'),
(137, 'FRANGO PASSARINHO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '898044047057', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326773_1000028410.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 17:26:13'),
(138, 'FREEGELLS CHOCOLATE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891151039512', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770327022_1000028425.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 17:30:22'),
(139, 'FREETAZ WAY', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400599', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770327075_1000028426.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-05 17:31:15'),
(140, 'FRUTAP', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896862002923', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391737_1000028952.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-06 11:28:57'),
(141, 'FUGINE EXTRATO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897517206284', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391787_1000028953.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-06 11:29:47'),
(142, 'FUNADA 250 ML', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896718700317', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391881_1000028957.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-06 11:31:21'),
(143, 'FUNADHIÑA 250ML', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896718700928', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391932_1000028960.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-06 11:32:12'),
(144, 'FURIOSO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942054655', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(145, 'FURIOSO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942055720', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770470576_1000029747.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-07 09:22:56'),
(146, 'FURIOSO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942054655', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(147, 'FURIOSO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942055218', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391992_1000028961.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-06 11:33:12'),
(148, 'FURIOSO 250 ML', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942055249', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131151_furioso 250ml.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-03 11:05:51'),
(149, 'FURIOSO 250ML', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942053320', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770470781_1000029749.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-07 09:26:21'),
(150, 'GUAPORE 1K', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897332000067', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130537_guapore.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-03 10:55:37'),
(151, 'GUARANA ANTANTICA 3LITROS', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7772106007063', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770471555_1000029786.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-07 09:39:15'),
(152, 'GUARANÁ MARAJA 310 ML', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897417400508', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770472159_1000029801.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-07 09:49:19'),
(153, 'GUARANÁ ZERO 350ML', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891991011235', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130434_guarana zero 350ml.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-03 10:53:54'),
(154, 'GUARDA NAPO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7893595269500', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770472946_1000029838.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-07 10:02:26'),
(155, 'HAMBURGUER', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891515554224', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770473557_1000029866.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-07 10:12:37'),
(156, 'KANECHOM', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7893694001827', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816972_1000034182.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-11 09:36:12'),
(157, 'KANECHOM', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7893694026660', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817021_1000034183.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-11 09:37:01'),
(158, 'KANECHOM', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0158', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-11 09:38:14'),
(159, 'KANECHOM', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7893694058661', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(160, 'KANECHOM', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7893694010669', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817247_1000034186.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-11 09:40:47'),
(161, 'KANECHOM', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7893694020668', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817203_1000034185.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-11 09:40:03'),
(162, 'KANECHOM', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7893694006662', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817149_1000034184.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-11 09:39:09'),
(163, 'KAPO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7894900650013', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817292_1000034187.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-11 09:41:32'),
(164, 'KAPO SABOR NARANJA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7894900563702', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817330_1000034188.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:16', '2026-02-11 09:42:10'),
(165, 'LÁMPADA 9W', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7899710006531', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770818213_1000034211.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:56:53'),
(166, 'LIANE CREAM CRACKER', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896080870144', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770828332_1000034345.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 12:45:32'),
(167, 'MARILAN LEITE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896003738582', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770835225_1000034415.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 14:40:26'),
(168, 'MAROMBA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898694892031', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770835327_1000034416.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 14:42:07'),
(169, 'MELITTA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891021001946', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770901989_1000035200.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:13:09'),
(170, 'MIKCAT SACHE GATO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898406303084', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770902048_1000035201.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:14:08'),
(171, 'MISTURA PARA BOLO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896423701357', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903491_1000035230.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:38:11'),
(172, 'MISTURA PARA BOLO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896423701388', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903540_1000035230.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:39:00'),
(173, 'MISTURA PARA BOLO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896423701401', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903582_1000035233.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:39:42'),
(174, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898919412341', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903952_1000035244.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:45:52'),
(175, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898919412334', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904073_1000035246.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:47:53'),
(176, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891350034615', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904150_1000035251.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:49:10'),
(177, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898919412372', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904332_1000035255.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:52:12'),
(178, 'MONSTER', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898938890090', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904509_1000035256.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:55:09'),
(179, 'MUCILON', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891000319581', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904814_1000035262.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:00:14'),
(180, 'NESTLE MUCILON', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891000319628', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770905660_1000035276.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:14:20'),
(181, 'NINFA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896111421536', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770905739_1000035277.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:15:39'),
(182, 'NINFA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '892417421536', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770905788_1000035278.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:16:28'),
(183, 'NISSIN PICANTE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891079014295', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770905849_1000035279.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:17:29'),
(184, 'ONLY396', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897534833111', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911351_1000035324.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:49:11'),
(185, 'OURO BRANCO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7622210570116', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911668_1000035349.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:54:28'),
(186, 'PAN', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896002311410', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911889_1000035353.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:58:09'),
(187, 'PARAFUSO AZUL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896423700251', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123867_parafuso dallas.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:04:27'),
(188, 'LEITE PARMALAT', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896034610017', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152465_elite parmalat.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:01:05'),
(189, 'PENNE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896423704204', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919633_1000035438.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:07:13'),
(190, 'PEPSI', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7892840813130', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919733_1000035440.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:08:53'),
(191, 'PINGO DE LEITTE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898943302946', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920271_1000035454.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:17:51'),
(192, 'POOCH MORANGO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '78928008', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(193, 'POOSH', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '78927995', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(194, 'POOSH', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '78927988', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(195, 'POP CHICLE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896379910520', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(196, 'POSTA DE TILAPIA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891527069365', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(197, 'POWER', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7771609003275', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(198, 'PRENDEDOR 12U', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897486800513', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(199, 'PRESTO BARBA ULTRA GIP', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '6952337300268', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(200, 'REFRIKO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942055935', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(201, 'REFRIKO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942055898', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(202, 'REFRIKO 200 ML', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942055942', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(203, 'RENATA DIVERRTIX', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896022203207', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(204, 'RENATA DIVERRTIX', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896022203771', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(205, 'VINO ROMA 473ML', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7898942055683', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119186_vino roma.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:46:26'),
(206, 'ROSQUINHA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896253401861', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920712_1000035457.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:25:12'),
(207, 'SADIA COXINHAS', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7893000488878', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(208, 'SALSICHA COPACOL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0208', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(209, 'SALTO VELOSO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7897812100782', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(210, 'SAMBIQUIRA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '5765115853808', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(211, 'SHOW GOL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896286622509', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(212, 'SHOW GOL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896286622530', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(213, 'SHOW GOL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896286622516', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(214, 'SHOW GOL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896286622523', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(215, 'SOCOCO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896004400020', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(216, 'SOLEIL', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '070330731806', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(217, 'SONHO CROCANTE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7622210570086', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920666_1000035456.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:24:26'),
(218, 'TERERÉ POR QUILO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0218', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(219, 'TORRADA BAUDUCCO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891962053189', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(221, 'TORTUGUITA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896058258653', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(222, 'TOSCANA BELLO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0222', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(223, 'TOSCANA PERDIGAO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0223', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(224, 'TOSCANA SADIA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7895408064814', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(225, 'TOSTINE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891168100014', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119651_tostines maizena.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:54:11'),
(226, 'TREE BOND', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896020470427', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(227, 'TRIEX', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896527701642', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(228, 'UNIBABY', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7393014852387', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(230, 'VIALUZ', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '0230', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(231, 'YPE', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896098904121', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(232, 'YPE CLEAR', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896098900253', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(233, 'YPE ULTRA', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7896098902394', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(234, 'YUKI', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7891095028344', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(235, 'ZOMO', 2, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, 0.0000, '7842559000772', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(236, 'CALABRESA SEARA', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7894904009862', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071631_CALABRESA SEARA.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:33:51'),
(237, 'COPACOL FILEZINHO', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7891527000795', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770081549_COPACOL FILEZINHO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 21:19:09'),
(238, 'COXA SADIA', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7893000005969', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770316295_1000028058.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 14:31:35'),
(239, 'COXINHA DA ASA', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7898641047002', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770316613_1000028073.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 14:36:53'),
(240, 'MOELA PERDIGAO', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7891515194864', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903688_1000035235.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:41:28'),
(241, 'PERDIGAO FIGADO', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7891515531331', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919855_1000035442.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:10:55'),
(242, 'QUEIJO', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7897119300922', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(243, 'RIM', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '0243', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(244, 'SALSICHA SEARA', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7896816882960', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121217_salchica seara.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:20:17'),
(245, 'STEAK COPACOL', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7891527064919', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920929_1000035461.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:28:49'),
(246, 'TOSCAN SEARA', 2, 'single', 3, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, '7894904727186', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(247, 'ACEITE SOYA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891107101621', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770061620_aceite soya.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 15:47:00'),
(248, 'AGUA E SAL DALLAS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896423705232', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770062926_AGUA DE DALLAS.avif', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 16:08:46'),
(249, 'AMENDOIM JAPONES (200G)', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897115102940', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066587_amendoim japones.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:09:47'),
(250, 'AMENDOIM RIO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7893582587792', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066605_amendo japon rio.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:10:05'),
(251, 'AMENDOIM SEM PELA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897115100229', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066631_amendoim sem pele.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:10:31'),
(252, 'AMENDOIM TIPO JAPONES 60G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897115108218', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066673_amendoim japones.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:11:13');
INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `product_custom_field5`, `product_custom_field6`, `product_custom_field7`, `product_custom_field8`, `product_custom_field9`, `product_custom_field10`, `product_custom_field11`, `product_custom_field12`, `product_custom_field13`, `product_custom_field14`, `product_custom_field15`, `product_custom_field16`, `product_custom_field17`, `product_custom_field18`, `product_custom_field19`, `product_custom_field20`, `image`, `woocommerce_media_id`, `product_description`, `created_by`, `woocommerce_product_id`, `woocommerce_disable_sync`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(253, 'ANGLO SALSICHA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7899567245220', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066873_anglo salchicha.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:14:33'),
(254, 'ARROZ CORADINI 1K', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896047200014', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770067814_arroz concordia.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:30:14'),
(255, 'BACON 60G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221401206', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068695_bacon crant.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:44:55'),
(256, 'BALA DE CAFÉ', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891666553640', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068842_bala cafe.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:47:22'),
(257, 'BALA FANTASY', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0257', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068895_BALA FANTASY.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:48:15'),
(258, 'BALA HORTELÃ', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0258', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068930_BALA HORTELÃ.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:48:50'),
(259, 'BATATA PALHA 90G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400605', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069122_batata palha 90g.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:52:02'),
(260, 'BATON AOLEITE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '78912359', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069178_BATON AOLEITE.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:52:58'),
(261, 'BISCOITO GALO SHOW', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896022204891', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069610_galo biscoito.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:00:10'),
(262, 'BISCOITO LIANE MAIZENA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896080862149', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069656_BISCOITO LIANE MAIZENA.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:00:56'),
(263, 'BISCOITO RENATA TWITTER', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896022207076', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069674_twitter.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:01:14'),
(264, 'BISCOITO TORTUGUITA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896058258660', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069857_tortuguita.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:04:17'),
(265, 'BOLETE PIRULITO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0265', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070143_BOLETE PIRULITO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:09:03'),
(266, 'BOLI BOLA GUDS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7899074789125', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070274_BOLI BOLA.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:11:14'),
(267, 'BOLIO BAUDUCO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891962067889', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070324_BOLIO BAUDUCO.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:12:04'),
(268, 'BOLIO BAUDUCO BAUNILHA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891962067346', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070371_BOLIO BAUDUCO BAUNILHA.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:12:51'),
(269, 'BOLO DIVERTIX', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0269', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070407_BOLO DIVERTIX.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:13:27'),
(270, 'BOMBOM SONHO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '78939301', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070553_BOMBOM SONHO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:15:53'),
(271, 'BONBON', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7893845569053', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070628_bombom.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:17:08'),
(272, 'BONO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7892421057205', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070653_bono.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:17:33'),
(274, 'BUBBALOO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7895800002964', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071273_BUBBALOO.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:27:53'),
(277, 'CANJICA PINDUCA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896015960360', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072133_CANJICA PINDUCA.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:42:13'),
(278, 'CANUDINHO DOCILE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451913586', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072413_CANUDINHO DOCILE AZUL.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:46:53'),
(279, 'CANUDINHO DOCILE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451912527', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072260_canudinho.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:44:20'),
(280, 'CANUDINHO DOCILE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451912510', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072299_CANUDINHO DOCILE.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:44:59'),
(281, 'CANUDINHO DOCILE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451912503', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072357_CANUDINHO DOCILE AMAR.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:45:57'),
(282, 'CARAMELOS LEITE E CHOCALATE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0282', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072500_CARAMELOS LEITE E CHOCALATE.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:48:20'),
(283, 'CAROLINA YOGURT', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896691101002', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072569_CAROLINA YOGURT.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:49:29'),
(284, 'CATA VENTO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7908274801817', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072697_CATA VENTO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:51:37'),
(286, 'CHICLETE ZONE TERRO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896043360309', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073408_CHICLETE ZONE TERRO.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 19:03:28'),
(288, 'COCADA DOCES LEO 50G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898932826033', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770080297_1000026183.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 20:58:17'),
(289, 'DALLAS MAIZENA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7892532396118', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152669_dallas maizena.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:04:29'),
(290, 'DISQUETI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896058500189', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152543_disqueti chocolate.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:02:23'),
(291, 'DISQUETI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896058591743', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770318407_1000028160.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 15:06:47'),
(292, 'DOCE LEO PACOCA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0619205818893', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770318530_1000028161.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 15:08:50'),
(293, 'DOCES LEO PACOQUINHA 15G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '751320849250', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770318593_1000028162.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 15:09:53'),
(294, 'DOCIGOMA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451911582', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770319378_1000028176.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 15:22:58'),
(295, 'DORIANA MATEGA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7892625110676', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152502_doriana mateqilla.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:01:42'),
(296, 'DUE BALA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0296', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 15:52:16'),
(297, 'EL DORO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221401756', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152485_el doro.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:01:25'),
(298, 'ESPAGUETE DALLAS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896423701005', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152686_dallas espaguete.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:04:46'),
(299, 'ESPAGUETE SANTA FELICIDADE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896423702811', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770151924_fideos-santa.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 16:52:04'),
(300, 'FAROFA DONANA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897406610017', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770323077_1000028296.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:24:37'),
(301, 'FESTBALL TUTTI FRUTTI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896043353295', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322874_1000028292.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:21:14'),
(302, 'FESTBALL TUTTI FRUTTI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896043353332', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322929_1000028293.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:22:09'),
(303, 'FINI CANUDINHO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7899142142258', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770323194_1000028303.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:26:34'),
(304, 'FREEGELLS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891151039734', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326931_1000028421.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:28:51'),
(305, 'FREEGELLS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891151039796', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326982_1000028424.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:29:42'),
(306, 'FREEGELLS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891151039758', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326823_1000028411.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:27:03'),
(307, 'FREEGELLS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891151039772', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326865_1000028416.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:27:45'),
(308, 'FREETAZ WAY', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400575', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770327150_1000028435.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:32:30'),
(309, 'FREETAZ WAY', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400582', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770327192_1000028436.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:33:12'),
(310, 'GAROTO CAIXA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897010905448', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131061_garoto 250g.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 11:04:22'),
(311, 'GAROTO EN BARRA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896835117197', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770470921_1000029750.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-07 09:28:42'),
(312, 'GAROTO EN BARRA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891000397107', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770470977_1000029751.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-07 09:29:38'),
(313, 'GELATINA MONICA UVA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896292312159', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(314, 'GELATINES ROJO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451912893', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152627_decile gelatina.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:03:47'),
(315, 'GELATINES', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451912886', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130859_gelatina lila.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 11:00:59'),
(316, 'GOLAZO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7894167513236', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130613_golaso.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:56:53'),
(317, 'GUDS BALL', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897190307582', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770473409_1000029862.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-07 10:10:09'),
(318, 'HALLS NEGRO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '78938816', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130135_halls negro.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:48:55'),
(319, 'HALLS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '78938793', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130160_halls rojo.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:49:20'),
(320, 'HALLS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '78938830', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770473497_1000029865.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-07 10:11:37'),
(321, 'HELLAMANN\'S 200G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7894000030470', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770128290_mayonesa hellmanns.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:18:10'),
(322, 'JUMBITOS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400056', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816762_1000034178.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:32:42'),
(323, 'JUMBITOS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400667', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816809_1000034179.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:33:29'),
(324, 'JUMBITOS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400131', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816886_1000034180.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:34:46'),
(325, 'JUPOCA 40G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400018', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816931_1000034181.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:35:31'),
(326, 'KETCHUP PREDILECTA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896876085585', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770122326_predilecta ketchup.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:38:46'),
(327, 'KISSFREE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0327', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152349_extraforte.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 16:59:09'),
(328, 'KRO ESQUINI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400483', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129480_kro.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:38:00'),
(329, 'KRO ESQUINI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400087', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817970_1000034208.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:52:50'),
(330, 'KRO ESQUINI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221401749', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817822_1000034198.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:50:22'),
(331, 'KRO ESQUINI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221402456', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817863_1000034199.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:51:03'),
(332, 'KRO ESQUINI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221402357', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817909_1000034200.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:51:49'),
(333, 'LACTA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7622210528216', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770818040_1000034209.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:54:00'),
(334, 'LACTA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7622210673831', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770818079_1000034210.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:54:39'),
(335, 'LASANHA 500G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896423703313', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129321_lasanha.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:35:21'),
(336, 'LEITE COCO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896705912778', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770818271_1000034212.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:57:51'),
(337, 'LEITE PIRACANJUBA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898215151708', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770818362_1000034214.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:59:22'),
(338, 'LEITE PO PIRACANJUBA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898215152439', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129239_leite po.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:34:36'),
(339, 'LEITE TRIÁNGULO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896434920549', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770818412_1000034215.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 10:00:12'),
(340, 'LIANE AGUA E SAL', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896080871141', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770818542_1000034217.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 10:02:22'),
(341, 'LIANE BISCOITO LEITE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896080861142', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770818603_1000034218.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 10:03:24'),
(342, 'LOURO KELLI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896705900171', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770834779_1000034408.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 14:32:59'),
(343, 'MACARRÃO PARAFUSO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896423700848', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770834874_1000034410.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 14:34:35'),
(344, 'MATEGA QUALY', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7893000394117', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770835384_1000034417.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 14:43:04'),
(345, 'MINTY DOCILE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451908377', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770902652_1000035205.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:24:12'),
(346, 'MINTY ROLLY', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451907660', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770127273_minty (2).jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:01:13'),
(347, 'MINTY ROLLY', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896451907189', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770902727_1000035206.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:25:27'),
(348, 'MIOJO DALLAS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896423705324', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770902812_1000035207.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:26:52'),
(349, 'MIOJO DALLAS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896423705317', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770902864_1000035208.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:27:44'),
(350, 'MIOJO NISSIN', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891079000229', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770902919_1000035209.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:28:39'),
(351, 'MIOJO NISSIN', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891079011775', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770902983_1000035210.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:29:43'),
(352, 'MIOJO NISSIN', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891079000311', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903032_1000035211.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:30:32'),
(353, 'MIOJO NISSIN', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891079014028', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903077_1000035212.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:31:17'),
(354, 'MIOJO NISSIN CARNE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891079000205', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903114_1000035213.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:31:55'),
(355, 'MIOJO RENATA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7895786123691', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903152_1000035214.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:32:32'),
(356, 'MISTURA DE BOLO BRIGADEIRO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896022205447', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903193_1000035215.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:33:13'),
(357, 'MOCOCA CREMA DE LEITE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7894163079330', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152751_creme-de-leite-piracanjuba-.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:05:51'),
(358, 'MOCOCA LEITE CONDESADA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7895730692679', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903640_1000035234.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:40:40'),
(359, 'MOLHO DE PIMENTA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897406602203', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770127164_molho de pimenta.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:59:24'),
(360, 'MOLHO DE TOMATE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896292333000', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903749_1000035239.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:42:29'),
(361, 'NESCAU 350G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891000426210', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770126330_nescau.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:45:30'),
(362, 'NESTLÉ BARRA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891000438503', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770126309_nestle 80g.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:45:09'),
(363, 'NESTLE BOMBOM', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891000325131', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770126281_nestle.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:44:41'),
(364, 'NUSITA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0364', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770126229_nusita.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:43:49'),
(365, 'ORÉGANO KELLI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7895944896283', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911401_1000035327.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:50:01'),
(366, 'OURO BRANCO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '78939318', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911582_1000035348.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:53:02'),
(367, 'OVO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7892307752439', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770124676_ovo brasilero.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:17:56'),
(368, 'PAÇOCA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897047000628', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911747_1000035350.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:55:47'),
(369, 'PACOCA BIG ROLHA DOCE LEO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891163752461', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911798_1000035351.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:56:38'),
(370, 'PANTANIX', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898929246226', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911980_1000035355.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:59:40'),
(371, 'PANTANIX', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898929246172', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770912027_1000035356.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 12:00:27'),
(372, 'PANTANIX', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898929246561', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770912070_1000035357.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 12:01:10'),
(373, 'PÃO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7892833889104', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770912131_1000035358.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 12:02:11'),
(374, 'PAO VISCONTI', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891962051338', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919114_1000035429.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 13:58:34'),
(375, 'PAPEL NACIONAL VERDE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7776507001750', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919284_1000035432.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:01:24'),
(376, 'QUEIJO PARMESÃO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897051580246', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121902_queijo parmesao.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:31:42'),
(377, 'PASSATEMPO CHOCOLATE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891000241356', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123818_passatempo.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:03:38'),
(378, 'PASSATEMPO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891000259351', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919385_1000035434.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:03:05'),
(379, 'PE DE MOLEQUE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897047002288', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919440_1000035435.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:04:00'),
(380, 'PE DE MULEQUI GRANDE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '0380', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919500_1000035436.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:05:00'),
(381, 'PESCOÇO DE GIRAFA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896058595420', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919956_1000035444.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:12:36'),
(382, 'PESCOÇO DE GIRAFA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896058596748', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919998_1000035451.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:13:18'),
(383, 'JUPOCA PIPOCA DOCE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7893130512658', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129621_jupoca.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:40:21'),
(384, 'PLUTONITA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7899341329290', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123175_plutonita.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:52:55'),
(385, 'POLVILHO DOCE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897332000197', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920400_1000035201.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:20:00'),
(386, 'POPLITO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898656685091', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(387, 'POPLITO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898656685152', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(388, 'PRESIDENT MUSSARELA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891097105074', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(389, 'PRESTIGIO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891000460207', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(390, 'PURURUCA PANTANIX', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898929246387', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(391, 'REAL YOGURT', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898240320070', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(392, 'RENAT DIVERTIX', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896022207106', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(393, 'ROSQUINHA (ITAMARATY) CANELA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891340365132', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(394, 'ROSQUINHA (ITAMARATY) CHOCOLATE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891340330116', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(395, 'ROSQUINHA (ITAMARATY) COCO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891340330314', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(396, 'ROSQUINHA (ITAMARATY) LEITE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891340330215', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(397, 'ROSQUINHA 300G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896253401465', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(398, 'ROSQUINHA 500G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896253402141', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(399, 'ROSQUINHA 800G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7899735280008', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(400, 'SADIA PRESUNTO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891515598266', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(401, 'SANDELLA 80G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896071019446', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17');
INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `product_custom_field5`, `product_custom_field6`, `product_custom_field7`, `product_custom_field8`, `product_custom_field9`, `product_custom_field10`, `product_custom_field11`, `product_custom_field12`, `product_custom_field13`, `product_custom_field14`, `product_custom_field15`, `product_custom_field16`, `product_custom_field17`, `product_custom_field18`, `product_custom_field19`, `product_custom_field20`, `image`, `woocommerce_media_id`, `product_description`, `created_by`, `woocommerce_product_id`, `woocommerce_disable_sync`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(402, 'SANDELLA 80G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896071019439', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(403, 'SANDELLA 80G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896071019453', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(404, 'SARDINA LIDIA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7753026204329', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121087_sardina lidita.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:18:07'),
(405, 'STACKE SADIA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7895901747948', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920885_1000035460.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:28:05'),
(406, 'SUCRILHOS 240G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896004007618', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1771016093_1000036388.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-13 16:54:53'),
(407, 'SUPREMO TERERE BOLBO 500G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7899767512474', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(408, 'SUPREMO TERERE BOLBO 500G', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7899767512603', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(409, 'TIC TAC MINTY', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '78916982', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770127322_minty.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:02:02'),
(410, 'TIME CHURRASCO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400506', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119941_time churrasco.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:59:01'),
(411, 'TIME', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400490', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(412, 'TIME PIZZA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896221400520', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(413, 'TORRADA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7891962052564', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(414, 'TORREZNO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896731683758', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119705_torrezno.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:55:05'),
(415, 'TRAKINAS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7622210592668', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(416, 'TRAKINAS', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7622210592750', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(417, 'TRIDENT', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7895800304228', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119621_trident.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:53:41'),
(418, 'TRIDENT', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7895800430002', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(419, 'TRIDENT', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7895800304211', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(420, 'UNIBABY YOGURT', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7898014850512', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(421, 'VITARELLA DOCE MAIZENA LEITE', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896213006426', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119413_Maizena_leite-.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:50:13'),
(422, 'VITATELLA AGUA E SAL', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896213006242', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(423, 'WAFER CHOCOLATE RENATA', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896022204945', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(424, 'WAFER LAN SHOW', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897047003278', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(425, 'WAFER LAN SHOW', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7897047003292', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(426, 'WAFER MORANGO RENATO', 2, 'single', 3, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, '7896022204952', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(427, 'ACETONA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896902209152', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770061950_acetonna.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 15:52:30'),
(428, 'ALBANY SABONETE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7908324404005', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770065754_ALBANHY ROSA.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 16:55:54'),
(430, 'ALBANY SABONETE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7897664171725', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770065828_ALBANHY ROSA Y BLANCO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 16:57:08'),
(431, 'ALBANY SABONETE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7908324404012', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770065904_ALBANHY AMARILLO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 16:58:24'),
(432, 'ALBANY SABONETE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7897664171756', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770065959_ALBANY HOMEN.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 16:59:19'),
(433, 'ALCOO LIQUIDO 1L', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7898948550601', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066070_alcool.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:01:10'),
(434, 'ALCOOL', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896090704804', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066121_alcool zumbi.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:02:01'),
(435, 'ALCOOL LIQUIDO', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896397758579', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(436, 'ALCOOL ROSA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7894376554372', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066329_Alcool.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:05:29'),
(437, 'ALGODÃO TOPZ', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7893742766838', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066363_algodon.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:06:04'),
(438, 'BARLA TALCO', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896806700069', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068979_BARLA TALCO.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:49:39'),
(439, 'BIC COMFORT2', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896596133061', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069385_bic comfort 2.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:56:25'),
(440, 'BIC COMFORT3', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '070330717534', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069407_bic comfort 3.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:56:47'),
(441, 'BIC COMFORT3', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '070330727984', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069455_BIC COMFORT3 NEGRO.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:57:35'),
(442, 'BIC COMFORT3', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '070330717565', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069498_BIC COMFORT3 VERDE.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:58:18'),
(443, 'BIOCOLOR', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7891350033564', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069591_BIOCOLOR.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:59:51'),
(444, 'BOZANO', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7890274009181', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070681_bozzano.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:18:01'),
(445, 'CLISS', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7891649786775', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770074030_CLISS VERDE.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 19:13:50'),
(446, 'CLISS', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '664441057865', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073976_CLISS ROSA.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 19:12:56'),
(447, 'COLGATE 180G', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7891024132371', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770081236_colgate.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 21:13:56'),
(448, 'COTONETE TOPZ', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896004814162', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770295684_1000027740.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 08:48:04'),
(449, 'CREMA DENTAL SORRISO 70G', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7891528029498', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120761_sorriso.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:12:41'),
(450, 'CREME H2O CERAMIDAS', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7898201575259', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130221_h2o crema.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:50:21'),
(451, 'CREME H2O LISOS', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7898201575266', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770316895_1000028086.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 14:41:35'),
(452, 'ESCOBA DE DENTE CLEANER', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7898940257027', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770321653_1000028230.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:00:53'),
(453, 'ESCOBA DE DENTE MAX', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7898940257041', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322229_1000028266.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:10:29'),
(454, 'FRANCIS', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7891176117493', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326706_1000028409.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:25:06'),
(455, 'GILLETTE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7893044497942', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130774_afeitadora rasuradora.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:59:34'),
(456, 'INTIMUS 16U', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896007545094', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129824_intimus rosa.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:43:44'),
(457, 'INTIMUS ABSORVENTE 8U', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896007540631', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816543_1000034174.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:29:03'),
(458, 'KIT SHAMPOO LILA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7509546689340', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817612_1000034193.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:46:52'),
(459, 'KIT SHAMPOO ROSA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7509546674353', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817658_1000034194.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:47:38'),
(460, 'KIT SHAMPOO VERDE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7509546668277', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817697_1000034195.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:48:17'),
(461, 'KIT SHAMPOO VERDE PASTEL', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7509546689357', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817739_1000034196.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:48:59'),
(462, 'MAXTON', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896013544128', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770835436_1000034418.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 14:43:56'),
(463, 'MAXTON', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896013544241', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770839006_1000034469.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 15:43:26'),
(464, 'MAXTON', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896013544210', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770900378_1000035194.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 08:46:18'),
(465, 'MAXTON', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896013544517', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770900434_1000035195.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 08:47:14'),
(466, 'MILI 16 UNIDADES', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7899467145033', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770128131_mili 16.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:15:31'),
(467, 'MILI 32U', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896104992494', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(468, 'MILI ABSORVENTE 8U', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896104993897', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770902151_1000035203.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:15:51'),
(469, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896235353904', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903853_1000035242.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:44:13'),
(470, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7898919411900', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903900_1000035243.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:45:00'),
(471, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896235353911', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904018_1000035245.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:46:58'),
(472, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7891350034622', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904192_1000035252.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:49:52'),
(473, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7891350034646', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904293_1000035254.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:51:33'),
(474, 'MONANGE', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896235354208', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904250_1000035253.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:50:50'),
(475, 'NIVEA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '4005900396938', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770905901_1000035280.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:18:21'),
(476, 'NIVEA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '4005900036728', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770905944_1000035281.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:19:04'),
(477, 'NIVEA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '4005808837311', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770905988_1000035282.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:19:48'),
(478, 'NIVEA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7791969016036', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770906039_1000035283.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:20:39'),
(479, 'NIVEA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '4005900122186', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770906117_1000035284.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:21:57'),
(480, 'NIVEA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '4006000015378', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770906176_1000035285.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:22:56'),
(481, 'PALOMA PAPEL HIGIÊNICO', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896026838252', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911850_1000035352.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:57:30'),
(482, 'PAPEL CISNE 12U', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896180108031', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919163_1000035430.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 13:59:23'),
(483, 'PAPEL CISNE 4 ROLOS', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7896180108017', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919208_1000035431.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:00:08'),
(484, 'PINÇA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '0484', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920187_1000035453.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:16:27'),
(485, 'PRESTO BARBA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '6952337300398', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(486, 'REXONA', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7892036974751', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(487, 'SABONETE FLOR', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7892634147687', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(488, 'SABONETE MOTIVUS', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7898908026085', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(489, 'SABONETE MOTIVUS', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7898908026078', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(490, 'SABONETE MOTIVUS', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7898908026061', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(492, 'SHAMPO SEDAL', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7891150037397', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120971_sedal.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:16:11'),
(493, 'SORRISO GRANDE 120G', 2, 'single', 3, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, '7509546667638', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120785_sorriso (2).jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:13:05'),
(494, 'FRALDA', 2, 'single', 3, NULL, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, 0.0000, '7890138447067', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770323852_1000028324.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:37:32'),
(495, 'FRALDA MAMI G', 2, 'single', 3, NULL, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, 0.0000, '7893360909662', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770323910_1000028325.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:38:30'),
(496, 'FRALDA MAMI XG', 2, 'single', 3, NULL, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, 0.0000, '7899136764428', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770324021_1000028326.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:40:21'),
(497, 'FRALDA MI BEBE M', 2, 'single', 3, NULL, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, 0.0000, '7894202412012', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770326659_1000028408.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:24:19'),
(498, '51 ICE LIMÃO', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7890654158430', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770061440_51 ice limon.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 15:44:00'),
(499, 'AMSTEL 355ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7896045507054', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066781_amstel 355ml.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:13:01'),
(500, 'AMSTEL PALITO', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7896045505319', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066804_amstel.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:13:24'),
(501, 'ANTARCTICA PILSEN 269ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891991010061', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770067315_antartica 269ml.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:21:55'),
(502, 'ANTARCTICA PILSEN PALITO', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7893475909137', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770067127_antartica 300ml.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:18:47'),
(503, 'ANTARTICA PILSEN 350ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '0503', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770067189_ANTARCTICA PILSEN.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:19:49'),
(504, 'BEATS', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149105564', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069334_BEATS.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:55:34'),
(505, 'BRAHMA CHOPP PALITO 269ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149103270', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070985_brahma lata 269ml.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:23:05'),
(506, 'BRAHMA GORDA', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149010509', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071014_brahma 350ml.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:23:34'),
(507, 'BRAHMA LITRIHO 300ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149010103', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(508, 'BRAHMA ZERO 355ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149104956', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071107_BRAHMA ZERO.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:25:07'),
(509, 'BRAMA ZERO', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149104932', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071176_BRAMA ZERO 350ML.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:26:16'),
(510, 'BUDWEISER 269ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7840050003803', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071422_BUDWEISER 269ML.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:30:22'),
(511, 'BUDWEISER DESCARTÁVEL', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891991014762', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071443_budweiser levar.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:30:43'),
(512, 'BUWAYSER LITRIHOS', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7899893979905', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071458_budweiser litriho.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:30:58'),
(513, 'CONTINIICE', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7899791440729', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770081338_ice contini.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 21:15:38'),
(514, 'CORONA', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149108718', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152837_corona.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:07:17'),
(515, 'CORONITA EXTRA', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149108749', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152823_coronita.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 17:07:03'),
(516, 'GLACIAL', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7896052601882', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130668_glacial.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:57:48'),
(517, 'H2OH', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7892840812850', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130191_h20h.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:49:51'),
(518, 'HEINEKEN', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '78936683', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130095_heineken.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:48:15'),
(519, 'HEINEKEN 600ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '78905498', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770483467_1000030028.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-07 12:57:47'),
(520, 'ICE CABARÉ LIMON', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7898377661848', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130043_ice cabare.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:47:23'),
(521, 'ICE CABARÉ', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7897395000509', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816377_1000034172.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:26:17'),
(522, 'JAMEL', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7898172660183', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129751_jamel.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:42:31'),
(523, 'JAMEL', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7898172660107', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816706_1000034177.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:31:46'),
(524, 'LOKAL 350ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7897592850822', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770128446_lokal.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:20:47'),
(525, 'MOEMA GORDA 350ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7898942053948', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770127181_moema.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:59:41'),
(526, 'ORIGINAL 269ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891991295086', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770124718_original.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:18:38'),
(527, 'ORIGINAL LITRIHO', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7892849291038', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770124735_original 300ml.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:18:55'),
(528, 'ORINAL 600ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '78905351', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911466_1000035328.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:51:06'),
(529, 'PACEÑA PALITO', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7772106007469', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770124052_pacena.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:07:32'),
(530, 'PETRA ORIGEM', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7897395099329', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920073_1000035452.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:14:33'),
(531, 'SKOL GORDA', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149200504', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120874_skol gorda.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:14:34'),
(532, 'SKOL LITRIHO 300ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149103300', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120857_skol litriho.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:14:17'),
(533, 'SKOL PALITO 269ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149103102', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120838_skol palito.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:13:58'),
(534, 'SPATE 350ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891991297424', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920757_1000035458.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:25:57'),
(535, 'SPATEN 330ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891991305440', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120732_spate.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:12:12'),
(536, 'SPATEN 600ML RETORNABLE', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891991297547', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920818_1000035459.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:26:58'),
(537, 'STELA ARTOIS', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891991015462', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120661_stella artois.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:11:01'),
(538, 'SUBZERO 350ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7890295842415', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120262_subzero.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:04:22'),
(539, 'SUBZERO PALITO', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891991010900', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920977_1000035462.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:29:37'),
(540, 'SUCO VALLE LATA', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7894900660319', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770126436_nectar valle.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:47:16'),
(541, 'SUCO VALLE', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7894900660265', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1771016020_1000036387.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-13 16:53:40'),
(542, 'SUCO VALLE', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '6893904660319', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1771016059_1000036387.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-13 16:54:19'),
(543, 'SUKITA LATA NARJA 350ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891149440603', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120075_sukita lata 350ml.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:01:15'),
(544, 'TONICA', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7891991000840', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119738_tonica.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:55:38'),
(545, 'VINHO ROMA 265ML', 2, 'single', 3, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, '7898942055980', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119307_VINO ROMA 265ML.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:48:27'),
(546, 'CIGARRO HILLS', 2, 'single', 3, NULL, NULL, NULL, 14, NULL, NULL, 'inclusive', 1, 0.0000, '78420151', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073729_hills.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 19:08:49'),
(547, 'CIGARRO HILLS', 2, 'single', 3, NULL, NULL, NULL, 14, NULL, NULL, 'inclusive', 1, 0.0000, '78422216', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073783_HILLS VERDE.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 19:09:43');
INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `product_custom_field5`, `product_custom_field6`, `product_custom_field7`, `product_custom_field8`, `product_custom_field9`, `product_custom_field10`, `product_custom_field11`, `product_custom_field12`, `product_custom_field13`, `product_custom_field14`, `product_custom_field15`, `product_custom_field16`, `product_custom_field17`, `product_custom_field18`, `product_custom_field19`, `product_custom_field20`, `image`, `woocommerce_media_id`, `product_description`, `created_by`, `woocommerce_product_id`, `woocommerce_disable_sync`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(548, 'FOX CIGARRO', 2, 'single', 3, NULL, NULL, NULL, 14, NULL, NULL, 'inclusive', 1, 0.0000, '78401266', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129898_fox.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:44:58'),
(549, 'BOLETE CARAMELO', 2, 'single', 3, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, '0549', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069897_BOLETE CARAMELO.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:04:57'),
(550, 'POP PIRULITO', 2, 'single', 3, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, '0550', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(551, 'ACEITE COAMO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896279600538', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770061525_aceite coamo.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 15:45:25'),
(552, 'ACEITE CONCORDIA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898247780075', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770061597_aceite concordia.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 15:46:37'),
(553, 'ARROZ BRILHANTE 5K', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896800777777', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770067630_ARROZ BRILHANTE 5K.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:27:10'),
(554, 'ARROZ BRILLANTE 1K', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896800777661', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770067660_arroz brillante.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:27:40'),
(555, 'ARROZ PREMIUM 1K', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7894233119010', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770067937_arros.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:32:17'),
(556, 'AZEITONA 140G', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897406603897', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068344_AZEITONA 140G.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:39:04'),
(557, 'AZUCAR 1K DOCE SUCAR', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7891167063365', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068486_azucar.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:41:26'),
(558, 'AZÚCAR DOCE SUCAR 2K', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898645421594', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068614_AZÚCAR DOCE SUCAR 2K.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:43:34'),
(559, 'AZUCAR SENORA (1K)', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7899549400050', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068537_senora azucar.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:42:17'),
(560, 'AZÚCAR SONORA 2K', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7899549400012', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770068669_AZÚCAR SONORA 2K.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:44:29'),
(561, 'BICARBONATO KELLI', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896705900058', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(562, 'CAFE 3 CORAÇÃO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7891138387421', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071480_cafe 3 coracoes.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:31:20'),
(563, 'CAFE AGRICULTOR', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897237802506', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071492_cafe agricultor.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:31:32'),
(564, 'CAFE BRASILEIRO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7891018427599', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071506_cafe brasilero.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:31:46'),
(565, 'CAFE FORT', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896005800546', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071544_CAFE FORT.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:32:24'),
(566, 'CHA MATE UNION', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897478100089', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073166_CHA MATE UNION.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:59:26'),
(567, 'CHAMPIGNON PONZAN 170G', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898270963575', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073208_CHAMPIGNON PONZAN 170G.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 19:00:08'),
(568, 'COCO RALADO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7893043266808', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770080973_coc ralado.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 21:09:33'),
(569, 'COCO SHOW', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898596080321', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770081106_COCO SHOW.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 21:11:46'),
(570, 'COLORAU', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7891418270313', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770295752_1000027740.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 08:49:12'),
(571, 'COMINHO KELLI', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896705900140', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770316142_1000028026.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 14:29:02'),
(572, 'DALLAS ARINA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896423700015', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770317389_1000028116.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 14:49:49'),
(573, 'ERVA CAPIMAR', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897478100164', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119988_terere capimar.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:59:48'),
(574, 'ERVILHAS', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897517209650', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131839_fugini ervilhas.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 11:17:19'),
(575, 'QUERO EXTRATO DE TOMATE 230ML', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7893781066647', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121796_quero extrato de tomate.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:29:56'),
(576, 'EXTRATO TOTELLI', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898950284440', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322468_1000028285.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:14:28'),
(577, 'FARINHA DE ROSCA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897332000081', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322811_1000028291.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:20:11'),
(578, 'FARINHA DONANA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897406600964', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152204_fariha donana.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 16:56:44'),
(579, 'FAROFA ZAELI', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896183901783', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152144_farofa zaeli.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 16:55:44'),
(580, 'FEIJÃO ELITE', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898069920109', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131959_fregol elite.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 11:19:19'),
(581, 'FERMENTO FLEISHMANN', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898409957970', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770151950_fermento.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 16:52:30'),
(582, 'FRISCO ABACAXI', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896045112098', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770327227_1000028437.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:33:47'),
(583, 'FRISCO CAJU', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896045112463', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770327268_1000028438.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:34:28'),
(584, 'FRISCO GOIABA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896045112456', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770327316_1000028443.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:35:16'),
(585, 'FRISCO LARANJA CON ACEROLA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896045112425', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770327357_1000028444.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:35:57'),
(586, 'FRISCO LIMON', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896045112128', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770327404_1000028445.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 17:36:44'),
(587, 'FRISCO MANGA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896045112111', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391534_1000028949.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-06 11:25:34'),
(588, 'FRISCO MARACUJÁ', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896045112135', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391475_1000028948.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-06 11:24:35'),
(589, 'FRISCO MORANGO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896045112142', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391620_1000028950.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-06 11:27:00'),
(590, 'FRISCO UVA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896045112104', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391688_1000028951.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-06 11:28:08'),
(591, 'FUBA MIMOSO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896257832753', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130596_guapore fuba.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:56:36'),
(592, 'GELATINA MONICA ABACAXI', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896292312180', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770471244_1000029752.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-07 09:34:04'),
(593, 'GELATINA MONICA ROJO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896292312166', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130794_gelatina.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:59:54'),
(594, 'GOIABADA 200G', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897977910332', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130644_goiabada amore.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:57:24'),
(595, 'HELLMANN\'S 500G', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7894000050034', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770483591_1000030036.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-07 12:59:51'),
(596, 'KELLI CANELA EM PO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896705900072', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817389_1000034189.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:43:09'),
(597, 'KELLI ERVA DOCE', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896705900164', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817429_1000034190.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:43:49'),
(598, 'KELLI SAL AMONIACO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896705900041', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817472_1000034191.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:44:32'),
(599, 'KETCHUP DAJUDA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896054903168', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817519_1000034192.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:45:19'),
(600, 'LEITE CONDENSADO PIRACANJUBO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898215152002', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770818321_1000034213.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:58:41'),
(601, 'MAIZENA 200G', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7894000010014', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770835106_1000034410.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 14:38:26'),
(602, 'MID', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896056968684', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770128168_mid ajinome.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:16:08'),
(603, 'MILHO VERDE', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897517209544', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131877_fugini 2.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 11:17:57'),
(604, 'MISTURA DE BOLO CENOURA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896022204914', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903246_1000035222.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:34:06'),
(605, 'MISTURA DE BOLO CHOCOLATE', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896022204181', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903404_1000035224.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:36:44'),
(606, 'MISTURA DE BOLO FUBÁ', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896022204204', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903452_1000035229.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:37:32'),
(607, 'MOLHO DE TOMATE FUGINI', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897517206086', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131796_fugini.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 11:16:36'),
(608, 'MOLHO DE TOMATE DONANA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897406610185', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770903816_1000035241.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 09:43:36'),
(609, 'PIMENTO KELLI', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896705900249', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(610, 'PIPOCA 400G', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7891095911356', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123538_pipoca yoki.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:58:58'),
(611, 'PIRACANJUBA CREMA DE LEITE', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898215151784', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770920308_1000035455.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:18:28'),
(612, 'POLENTINA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7894321631011', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123142_polentina.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:52:22'),
(613, 'PREDILECTA ESTRATO TOMATE', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896292333123', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(614, 'PREDILECTA MILHO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896292340503', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(615, 'REQUEIJAO BATAVO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7891097090004', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(616, 'ROYAL', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7622300119621', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121250_royal.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:20:50'),
(617, 'SAL ALMIRANTE', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896110194363', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(618, 'SAL GROSSO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896063700642', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(619, 'SAZON CARNE', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7891132019281', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121044_sazon_carnes-700x700.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:17:24'),
(620, 'SAZON', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7891132019724', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(621, 'SELETA', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897517209674', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120956_seleta-de-legumes-em-.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:15:56'),
(622, 'SUPREMO TERERE 500G FOGO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7899767516861', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(623, 'SUPREMO TERERE HORTELA 500G', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7899767512528', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(624, 'TANG', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898389711029', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120006_tang.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:00:06'),
(625, 'TEMPERO DONANA 300G', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897406601244', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(626, 'TEMPERO SEM PEMENTA 300G', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7897406604757', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(627, 'VALE QUEIJO RALADO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7898924049501', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(628, 'VINAGRE AMARELO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896048284792', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(629, 'VINAGRE BRANCO', 2, 'single', 3, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, '7896048284631', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119344_vinagre.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:49:04'),
(630, 'AGUA OXIGENADA 20', 2, 'single', 3, NULL, NULL, NULL, 17, NULL, NULL, 'inclusive', 1, 0.0000, '7897534833289', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770063278_AGUA OXIGENADA 20.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 16:14:38'),
(631, 'ALIKAL', 2, 'single', 3, NULL, NULL, NULL, 17, NULL, NULL, 'inclusive', 1, 0.0000, '0631', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066433_alikal.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:07:13'),
(632, 'BAYGON CUCARACHAS', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7790520999436', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069263_BAYGON CUCARACHAS.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:54:23'),
(633, 'BAYON MATA MOSCAS', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7790520999429', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770069279_baygon.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 17:54:39'),
(634, 'BOMBRIL ASSOLAR', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896090100101', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770070607_BOMBRIL ASSOLAR.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:16:47'),
(635, 'CASA FLOR 1,75L', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '826048500117', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072643_casaflor.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:50:43'),
(636, 'CERA LIQUIDA POLITRIZ', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896440501497', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072931_CERA LIQUIDA POLITRIZ.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 18:55:31'),
(637, 'DETERGENTE YPE MAÇÃ', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098900215', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770318051_1000028152.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 15:00:51'),
(638, 'DOWNY', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7500435259583', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770319526_1000028177.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 15:25:26'),
(639, 'ESPONJA', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896314707871', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152379_esponja.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 16:59:39'),
(640, 'FACILLE LARAJA', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7897938903021', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322515_1000028288.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:15:15'),
(641, 'FACILLE LAVANDA', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7897938903014', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152291_facille.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 16:58:11'),
(642, 'FACILLE LIMÃO', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7897938903007', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770322619_1000028289.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-05 16:16:59'),
(643, 'GIRANDO SOL 800G', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896404607692', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770471405_1000029785.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-07 09:36:45'),
(644, 'KIT TIXAN', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098909614', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770817779_1000034197.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-11 09:49:39'),
(645, 'NAFTALINA', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7898586612303', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904866_1000035263.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 10:01:06'),
(646, 'OESTE', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7898247330256', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911034_1000035311.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:43:54'),
(647, 'OESTE', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7898247330249', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911101_1000035312.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:45:01'),
(648, 'OESTE', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7898247330263', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911149_1000035313.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:45:49'),
(649, 'OMO 2,2KG', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7891150069121', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911267_1000035319.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 11:47:47'),
(650, 'OMO 800G', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7891150064317', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770126160_omo.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 09:42:40'),
(651, 'PEDRA SANITÁRIA', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7898293130053', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919578_1000035437.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-12 14:06:18'),
(652, 'POLITIZ DETERGENTE 500ML', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7895121611005', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123116_politiz.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:51:56'),
(653, 'QBOA 1L', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896083800018', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770122142_qboa lavandina.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:35:42'),
(654, 'RODO (EVA)', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7897388600051', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(655, 'SABÃO EN BARRA', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098905906', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(656, 'SABAO OESTE', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7898247330225', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(657, 'SABÃO TIXAN MACIEZ 400G', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098909720', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119866_tixa 400g.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:57:46'),
(658, 'SABÃO TIXAN ROSA 400G', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098909737', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(659, 'SACOS DE LIXO', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7898293130565', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121236_sacos para lixo.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 08:20:36'),
(660, 'SANITARIA POLITRIZ', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896440501381', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(661, 'SEMPRE VIVA 5L', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7897938905209', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(662, 'TIXAN 800G', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098909898', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(663, 'TRIEX 1,75L', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896527701420', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(664, 'TRIEX 1,75L', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896527701437', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(665, 'TRIEX DETERGENTE', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7899633067152', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119568_triex.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 07:52:48'),
(666, 'UAU 1L', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7891242457324', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(667, 'UAU 1L', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7891242457317', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(668, 'UAU 3L', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7891242420137', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(669, 'VASSORA (ATUAL)', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7897388600860', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(670, 'VASSORA (GENIAL)', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7897388602079', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(671, 'VEJA LILA', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7891035249433', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(672, 'VEJA ROSA', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7891035249228', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(673, 'YPE 2L', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098902400', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(674, 'YPE 500ML', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098904091', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129184_limpperfumado-500ml-doce-vida-rosa.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-03 10:33:04'),
(675, 'YPE AMACIANTE ACONCHEGO', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098900406', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(676, 'YPE AMACIANTE TERNURA', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098900413', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(677, 'YPE COCO', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098900239', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(678, 'YPE DESINFECTANTE', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098903629', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(679, 'YPE LIMAO', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098900222', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(680, 'YPE LIMAO', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098902042', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(681, 'YPE NEUTRO', 2, 'single', 3, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, '7896098900208', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(682, 'FARO SACHE', 2, 'single', 3, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, '7896048920706', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152166_faro cao adulto.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 16:56:07'),
(683, 'FARO SACHE GATO', 2, 'single', 3, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, '7896048920607', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770323037_1000028295.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-05 16:23:57'),
(684, 'RACAO CHANIN', 2, 'single', 3, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, '0684', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152943_chanin.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 17:09:03'),
(685, 'RAÇAO QUALIDY', 2, 'single', 3, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, '7898180501645', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(686, 'AGUA AQUARELA 510ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898292370054', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770062197_agua acuarela 510ml.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 15:58:25'),
(687, 'AGUA AQUARELA 1,5 L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898292370047', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770062408_agua aquarela.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 16:00:08'),
(688, 'AGUA AQUARELA COM GAS 510ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898292370153', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770062447_agua aquarela gas.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 16:00:47'),
(689, 'AGUA CON GAS', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7894726747003', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18');
INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `product_custom_field5`, `product_custom_field6`, `product_custom_field7`, `product_custom_field8`, `product_custom_field9`, `product_custom_field10`, `product_custom_field11`, `product_custom_field12`, `product_custom_field13`, `product_custom_field14`, `product_custom_field15`, `product_custom_field16`, `product_custom_field17`, `product_custom_field18`, `product_custom_field19`, `product_custom_field20`, `image`, `woocommerce_media_id`, `product_description`, `created_by`, `woocommerce_product_id`, `woocommerce_disable_sync`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(690, 'AGUA DE COCO', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7896000593764', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770062705_PURO COC.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 16:05:05'),
(691, 'ANTARCTICA GUARANÁ ZERO 352ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898778746410', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066949_guarana zero 350ml.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 17:15:49'),
(692, 'CHAMYTO 100G', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891000252833', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073263_CHAMYTO 100G.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 19:01:03'),
(693, 'CHAMYTO 100G', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891000360668', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073336_CHAMYTO 100G CORA.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 19:02:16'),
(694, 'COCA COLA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '77716088', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770074055_coca cola 2l.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 19:14:15'),
(695, 'COCA COLA 350ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7894900010015', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770074081_coca cola 350ml.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 19:14:41'),
(696, 'COCA COLA 3L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7771609000960', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770074140_COCA COLA 3L.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 19:15:40'),
(697, 'COCA COLA CERO 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7771605000889', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770074192_COCA COLA CERO 2L.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 19:16:32'),
(698, 'COCA COLA MINI 600ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '77716064', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770074224_coca cola 600ml.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 19:17:04'),
(699, 'COCA MINI 220 ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7894900010398', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770074243_coca cola lata 22oml.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 19:17:23'),
(700, 'COCA MINI CERO 220ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7893774512151', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770074262_coca cero mini 220ml.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 21:00:03'),
(702, 'DEL VALLE FRUT LARAJA', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7894900556063', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770317464_1000028117.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-05 14:51:04'),
(703, 'DEL VALLE FRUT UVA', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7894900550061', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770317716_1000028124.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-05 14:55:16'),
(704, 'DEL VALLE KAPO UVA', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7894900593709', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152589_del valle uva.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 17:03:09'),
(705, 'DEL VALLE KAPO', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7894900583700', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770317806_1000028133.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-05 14:56:46'),
(706, 'ENERGÉTICO 8 SEGUNDO', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7896619811006', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770321719_1000028231.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-05 16:01:59'),
(707, 'ENERGETICO 8 SEGUNDOS', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7896718701949', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770321787_1000028232.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-05 16:03:07'),
(708, 'FURIOSO 2L NEGRO', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898942053306', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131130_furiosos 2l.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 11:05:30'),
(709, 'ENERGÉTICO RED HORSE', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7893630172710', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121508_red horse.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:25:08'),
(710, 'FANTA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7771605000032', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770152218_fanta 2l.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 16:56:58'),
(711, 'FRUTUBA LARANJA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7892168380451', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131899_frutuba naraja.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 11:18:19'),
(712, 'FRUTUBA LIMÃO 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898990913751', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131916_frutuba limon.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 11:18:36'),
(713, 'FUNADA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7896718700225', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131578_funada 2l.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 11:12:58'),
(714, 'GUARANÁ ANTÁRTICA 1L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891979724980', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770471641_1000029787.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-07 09:40:41'),
(715, 'GUARANA ANTARTICA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7772106004055', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770471859_1000029792.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-07 09:44:20'),
(716, 'GUARANA LATA 350ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891991000826', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770131042_gauarana 350ml.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 11:04:02'),
(717, 'GUARANÁ MARAJÁ 350ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7899248262386', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770128334_maraja.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:18:54'),
(718, 'GUARANA PALITO', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7893998656686', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770472404_1000029804.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-07 09:53:24'),
(719, 'ICE COLA 1,5ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7893518598700', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816445_1000034173.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-11 09:27:25'),
(720, 'ICE COLA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898938236034', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129993_ice cola 2l.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:46:33'),
(721, 'ICE COLA 3L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898938236010', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129974_ice cola 3l.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:46:14'),
(722, 'ICE COLA LATA 350ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7897307582970', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129947_icecola-350ml.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:45:47'),
(723, 'KITUBAÍNA 350ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7895892600437', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770129519_Kitubaina-Lata-350ml.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:38:39'),
(724, 'MARAJA GUARANA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7897417400140', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770128378_maraja guara 2l.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:51:51'),
(725, 'MARAJA NARAJA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7897417400157', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770128421_maraja 2l naranja.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:20:21'),
(726, 'MARAJÁ GUARANA 3L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7897417402489', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770130469_maraja 3l.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:54:29'),
(727, 'MARAJA SEN ACUCAR', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7897417403004', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770835158_1000034414.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-11 14:39:18'),
(728, 'MATE CHIMARRÃO', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7896718701284', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770128309_mate chimarrau.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:18:29'),
(729, 'Mocoquinha', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898904435096', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770127224_mocoquinha chocolate.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:00:24'),
(730, 'MONSTER', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7084704323', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770127136_monster.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 09:58:56'),
(731, 'MONSTER MANGO LOCO', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '070847033301', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904600_1000035258.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 09:56:40'),
(732, 'MONSTER PACIFICC', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '1220000250031', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904769_1000035261.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 09:59:29'),
(733, 'MONSTER PACIFICC', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '1220000250147', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904651_1000035259.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 09:57:31'),
(734, 'MONSTER PACIFICC', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898938890045', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770904693_1000035260.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 09:58:13'),
(735, 'NUTRI NECTAR 1L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898920195301', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770906218_1000035286.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 10:23:38'),
(736, 'NUTRI NECTAR 1L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898961490526', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770906262_1000035287.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 10:24:22'),
(737, 'NUTRI NECTAR 1L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898920195141', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770906310_1000035288.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 10:25:10'),
(738, 'PEPSI 1L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7772106001467', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919795_1000035441.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 14:09:55'),
(739, 'PEPSI 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7772106001436', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770043434_pepsi 2l.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 10:43:54'),
(740, 'PEPSI BLACK 500ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7892766825583', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123655_pepsi cero.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 09:00:55'),
(741, 'PEPS LATA 340ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7892840800079', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123761_pepsi 350ml.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 09:02:41'),
(742, 'PEPSI ZERO LATA 350ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7894842672883', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123700_pepsi black 350ml.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 09:01:40'),
(743, 'PILFRUT 190ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891779308113', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123589_pilfrut.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:59:49'),
(744, 'POWER ENERGÉTICO AZUL', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7771609003268', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770122370_power.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:39:30'),
(745, 'REDBULL', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '9002490100070', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121480_redbull.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:24:40'),
(746, 'REFRIKO UVA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891457334991', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770121454_refrico uva.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:24:15'),
(747, 'SODA LIMONADA', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7895689307303', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120821_soda limonada.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:13:41'),
(748, 'SPRITE 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7771605000049', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120684_sprite 2l.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:11:24'),
(749, 'SUKITA NARAJA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891149440801', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120240_sukita 2l.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:04:00'),
(750, 'SUKITA UVA 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891149102808', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1771016167_1000036390.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-13 16:56:07'),
(751, 'SUKITA LIMAO 2L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891991297172', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1771016126_1000036389.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-13 16:55:26'),
(752, 'SUKITA UVA 350ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891149102785', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1771016204_1000036391.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-13 16:56:44'),
(753, 'TAMPICO 2,5L', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7771224001755', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120026_Tampico-Citrus-25L.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:00:26'),
(754, 'TAMPICO 500ML', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7771224000765', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770120044_tampico pequeno.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:00:44'),
(755, 'TODYNHO PIRA KIDS', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7898215151807', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770122187_pria kids.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:36:27'),
(756, 'VIGOR VIG NARANJA', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891999340108', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119463_vigor vig.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 07:51:03'),
(757, 'VIGOR VIG', 2, 'single', 3, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, '7891999100047', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(758, 'CAIDEIRA 450ML', 2, 'single', 3, NULL, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, 0.0000, '7898576190057', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770071563_caideira.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 18:32:43'),
(759, 'CAIPIRINHA', 2, 'single', 3, NULL, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, 0.0000, '7891991304849', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(760, 'CATUABA 920ML', 2, 'single', 3, NULL, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, 0.0000, '7896514701976', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072796_CATUABA 920ML.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 18:53:16'),
(761, 'OLDEN WACK WISKY', 2, 'single', 3, NULL, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, 0.0000, '7898422675301', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911207_1000035318.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 11:46:47'),
(763, 'VODKA BALALAIKA', 2, 'single', 3, NULL, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, 0.0000, '7896273100263', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(764, 'VODKA BAMBOA', 2, 'single', 3, NULL, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, 0.0000, '7898576190019', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(765, 'ALUMÍNIO', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7898933283170', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770066456_aluminio.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 17:07:36'),
(766, 'Bolsa Belón 17x34', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7899951622910', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(767, 'Bolsa Belón 24x42', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7890870310605', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(768, 'CARBON 3K', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7898671236063', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770072524_carbon 3k.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 18:48:44'),
(769, 'CIGARRO CAMEL', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '78948037', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770073664_CAMEL.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 19:07:44'),
(770, 'ERVA MATE KUNATAI', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7898636830374', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770321881_1000028235.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-05 16:04:41'),
(771, 'ERVA MATE KUNATAI', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7898636830435', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770321977_1000028245.png', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-05 16:06:17'),
(772, 'FILTRO DE CAFÉ', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7897042210442', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770151887_filtro.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 16:51:27'),
(773, 'FOSFORO', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896080900117', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770132025_fosforo.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 11:20:25'),
(774, 'FUMO CORINGA', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7898970135029', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770391834_1000028956.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-06 11:30:34'),
(775, 'GUARDANAPOS', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7890015760661', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770473322_1000029859.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-07 10:08:42'),
(776, 'ISQUEIRO', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7892122598991', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816593_1000034175.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-11 09:29:53'),
(777, 'ISQUEIRO', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '4000842868499', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770816633_1000034176.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-11 09:30:33'),
(778, 'LENHA 10K', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '0778', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770119843_TOCO LENHA.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 07:57:23'),
(779, 'MILI DIA Y NOITE 16U', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896104993903', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770902602_1000035204.webp', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 09:23:22'),
(780, 'MILI NOTURNO 16U', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896104993880', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770128077_mili noturno.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 10:14:37'),
(781, 'NESTLE GALAK', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '0781', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(782, 'PALITOS DENTE', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896080901442', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770124034_palito parana.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 09:07:14'),
(783, 'PANASONIC 2 PARES', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7895466549193', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770911935_1000035354.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 11:58:55'),
(784, 'PAPEL TOALHAS SOCIAL', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896914000716', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919328_1000035433.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 14:02:08'),
(785, 'PILHA AA GRANDE PILA', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896067203170', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919904_1000035443.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 14:11:44'),
(786, 'PILHA AAA PILA PEQUENA', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '0786', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123606_pila panasonic.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 09:00:06'),
(787, 'SALSICHA', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896031232083', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(788, 'SARDINHA DE TOMATE', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896117100367', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(789, 'SARDINHA PALMEIRA', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896117100350', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(790, 'SUPERGLUE', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '9771473968012', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1771016250_1000036392.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-13 16:57:30'),
(791, 'TERERE KARINA', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7896818500237', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(792, 'TERERE SAO ROQUE', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7897487300463', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(793, 'TERERE SAO ROQUE', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7897487300678', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(794, 'VELA', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '7893130865297', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(795, 'WINSTON', 2, 'single', 3, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, '78939974', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(796, 'PEPINO', 2, 'single', 3, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '0796', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770919688_1000035439.jpg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-12 14:08:08'),
(797, 'PIMENTON', 2, 'single', 3, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7893487763932', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123555_pimenton.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:59:15'),
(798, 'PLATANO FREIR', 2, 'single', 3, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '7895310018950', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1770123193_platano freir.jpeg', NULL, NULL, 8, NULL, 0, NULL, NULL, 0, 0, '2026-02-02 09:40:18', '2026-02-03 08:53:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(3, 1),
(3, 2),
(2, 1),
(2, 2),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(117, 3),
(118, 3),
(119, 3),
(120, 3),
(121, 3),
(122, 3),
(123, 3),
(124, 3),
(125, 3),
(126, 3),
(127, 3),
(128, 3),
(129, 3),
(130, 3),
(131, 3),
(132, 3),
(133, 3),
(134, 3),
(135, 3),
(136, 3),
(137, 3),
(138, 3),
(139, 3),
(140, 3),
(141, 3),
(142, 3),
(143, 3),
(144, 3),
(145, 3),
(146, 3),
(147, 3),
(148, 3),
(149, 3),
(150, 3),
(151, 3),
(152, 3),
(153, 3),
(154, 3),
(155, 3),
(156, 3),
(157, 3),
(158, 3),
(159, 3),
(160, 3),
(161, 3),
(162, 3),
(163, 3),
(164, 3),
(165, 3),
(166, 3),
(167, 3),
(168, 3),
(169, 3),
(170, 3),
(171, 3),
(172, 3),
(173, 3),
(174, 3),
(175, 3),
(176, 3),
(177, 3),
(178, 3),
(179, 3),
(180, 3),
(181, 3),
(182, 3),
(183, 3),
(184, 3),
(185, 3),
(186, 3),
(187, 3),
(188, 3),
(189, 3),
(190, 3),
(191, 3),
(192, 3),
(193, 3),
(194, 3),
(195, 3),
(196, 3),
(197, 3),
(198, 3),
(199, 3),
(200, 3),
(201, 3),
(202, 3),
(203, 3),
(204, 3),
(205, 3),
(206, 3),
(207, 3),
(208, 3),
(209, 3),
(210, 3),
(211, 3),
(212, 3),
(213, 3),
(214, 3),
(215, 3),
(216, 3),
(217, 3),
(218, 3),
(219, 3),
(220, 3),
(221, 3),
(222, 3),
(223, 3),
(224, 3),
(225, 3),
(226, 3),
(227, 3),
(228, 3),
(229, 3),
(230, 3),
(231, 3),
(232, 3),
(233, 3),
(234, 3),
(235, 3),
(236, 3),
(237, 3),
(238, 3),
(239, 3),
(240, 3),
(241, 3),
(242, 3),
(243, 3),
(244, 3),
(245, 3),
(246, 3),
(247, 3),
(248, 3),
(249, 3),
(250, 3),
(251, 3),
(252, 3),
(253, 3),
(254, 3),
(255, 3),
(256, 3),
(257, 3),
(258, 3),
(259, 3),
(260, 3),
(261, 3),
(262, 3),
(263, 3),
(264, 3),
(265, 3),
(266, 3),
(267, 3),
(268, 3),
(269, 3),
(270, 3),
(271, 3),
(272, 3),
(273, 3),
(274, 3),
(275, 3),
(276, 3),
(277, 3),
(278, 3),
(279, 3),
(280, 3),
(281, 3),
(282, 3),
(283, 3),
(284, 3),
(285, 3),
(286, 3),
(287, 3),
(288, 3),
(289, 3),
(290, 3),
(291, 3),
(292, 3),
(293, 3),
(294, 3),
(295, 3),
(296, 3),
(297, 3),
(298, 3),
(299, 3),
(300, 3),
(301, 3),
(302, 3),
(303, 3),
(304, 3),
(305, 3),
(306, 3),
(307, 3),
(308, 3),
(309, 3),
(310, 3),
(311, 3),
(312, 3),
(313, 3),
(314, 3),
(315, 3),
(316, 3),
(317, 3),
(318, 3),
(319, 3),
(320, 3),
(321, 3),
(322, 3),
(323, 3),
(324, 3),
(325, 3),
(326, 3),
(327, 3),
(328, 3),
(329, 3),
(330, 3),
(331, 3),
(332, 3),
(333, 3),
(334, 3),
(335, 3),
(336, 3),
(337, 3),
(338, 3),
(339, 3),
(340, 3),
(341, 3),
(342, 3),
(343, 3),
(344, 3),
(345, 3),
(346, 3),
(347, 3),
(348, 3),
(349, 3),
(350, 3),
(351, 3),
(352, 3),
(353, 3),
(354, 3),
(355, 3),
(356, 3),
(357, 3),
(358, 3),
(359, 3),
(360, 3),
(361, 3),
(362, 3),
(363, 3),
(364, 3),
(365, 3),
(366, 3),
(367, 3),
(368, 3),
(369, 3),
(370, 3),
(371, 3),
(372, 3),
(373, 3),
(374, 3),
(375, 3),
(376, 3),
(377, 3),
(378, 3),
(379, 3),
(380, 3),
(381, 3),
(382, 3),
(383, 3),
(384, 3),
(385, 3),
(386, 3),
(387, 3),
(388, 3),
(389, 3),
(390, 3),
(391, 3),
(392, 3),
(393, 3),
(394, 3),
(395, 3),
(396, 3),
(397, 3),
(398, 3),
(399, 3),
(400, 3),
(401, 3),
(402, 3),
(403, 3),
(404, 3),
(405, 3),
(406, 3),
(407, 3),
(408, 3),
(409, 3),
(410, 3),
(411, 3),
(412, 3),
(413, 3),
(414, 3),
(415, 3),
(416, 3),
(417, 3),
(418, 3),
(419, 3),
(420, 3),
(421, 3),
(422, 3),
(423, 3),
(424, 3),
(425, 3),
(426, 3),
(427, 3),
(428, 3),
(429, 3),
(430, 3),
(431, 3),
(432, 3),
(433, 3),
(434, 3),
(435, 3),
(436, 3),
(437, 3),
(438, 3),
(439, 3),
(440, 3),
(441, 3),
(442, 3),
(443, 3),
(444, 3),
(445, 3),
(446, 3),
(447, 3),
(448, 3),
(449, 3),
(450, 3),
(451, 3),
(452, 3),
(453, 3),
(454, 3),
(455, 3),
(456, 3),
(457, 3),
(458, 3),
(459, 3),
(460, 3),
(461, 3),
(462, 3),
(463, 3),
(464, 3),
(465, 3),
(466, 3),
(467, 3),
(468, 3),
(469, 3),
(470, 3),
(471, 3),
(472, 3),
(473, 3),
(474, 3),
(475, 3),
(476, 3),
(477, 3),
(478, 3),
(479, 3),
(480, 3),
(481, 3),
(482, 3),
(483, 3),
(484, 3),
(485, 3),
(486, 3),
(487, 3),
(488, 3),
(489, 3),
(490, 3),
(491, 3),
(492, 3),
(493, 3),
(494, 3),
(495, 3),
(496, 3),
(497, 3),
(498, 3),
(499, 3),
(500, 3),
(501, 3),
(502, 3),
(503, 3),
(504, 3),
(505, 3),
(506, 3),
(507, 3),
(508, 3),
(509, 3),
(510, 3),
(511, 3),
(512, 3),
(513, 3),
(514, 3),
(515, 3),
(516, 3),
(517, 3),
(518, 3),
(519, 3),
(520, 3),
(521, 3),
(522, 3),
(523, 3),
(524, 3),
(525, 3),
(526, 3),
(527, 3),
(528, 3),
(529, 3),
(530, 3),
(531, 3),
(532, 3),
(533, 3),
(534, 3),
(535, 3),
(536, 3),
(537, 3),
(538, 3),
(539, 3),
(540, 3),
(541, 3),
(542, 3),
(543, 3),
(544, 3),
(545, 3),
(546, 3),
(547, 3),
(548, 3),
(549, 3),
(550, 3),
(551, 3),
(552, 3),
(553, 3),
(554, 3),
(555, 3),
(556, 3),
(557, 3),
(558, 3),
(559, 3),
(560, 3),
(561, 3),
(562, 3),
(563, 3),
(564, 3),
(565, 3),
(566, 3),
(567, 3),
(568, 3),
(569, 3),
(570, 3),
(571, 3),
(572, 3),
(573, 3),
(574, 3),
(575, 3),
(576, 3),
(577, 3),
(578, 3),
(579, 3),
(580, 3),
(581, 3),
(582, 3),
(583, 3),
(584, 3),
(585, 3),
(586, 3),
(587, 3),
(588, 3),
(589, 3),
(590, 3),
(591, 3),
(592, 3),
(593, 3),
(594, 3),
(595, 3),
(596, 3),
(597, 3),
(598, 3),
(599, 3),
(600, 3),
(601, 3),
(602, 3),
(603, 3),
(604, 3),
(605, 3),
(606, 3),
(607, 3),
(608, 3),
(609, 3),
(610, 3),
(611, 3),
(612, 3),
(613, 3),
(614, 3),
(615, 3),
(616, 3),
(617, 3),
(618, 3),
(619, 3),
(620, 3),
(621, 3),
(622, 3),
(623, 3),
(624, 3),
(625, 3),
(626, 3),
(627, 3),
(628, 3),
(629, 3),
(630, 3),
(631, 3),
(632, 3),
(633, 3),
(634, 3),
(635, 3),
(636, 3),
(637, 3),
(638, 3),
(639, 3),
(640, 3),
(641, 3),
(642, 3),
(643, 3),
(644, 3),
(645, 3),
(646, 3),
(647, 3),
(648, 3),
(649, 3),
(650, 3),
(651, 3),
(652, 3),
(653, 3),
(654, 3),
(655, 3),
(656, 3),
(657, 3),
(658, 3),
(659, 3),
(660, 3),
(661, 3),
(662, 3),
(663, 3),
(664, 3),
(665, 3),
(666, 3),
(667, 3),
(668, 3),
(669, 3),
(670, 3),
(671, 3),
(672, 3),
(673, 3),
(674, 3),
(675, 3),
(676, 3),
(677, 3),
(678, 3),
(679, 3),
(680, 3),
(681, 3),
(682, 3),
(683, 3),
(684, 3),
(685, 3),
(686, 3),
(687, 3),
(688, 3),
(689, 3),
(690, 3),
(691, 3),
(692, 3),
(693, 3),
(694, 3),
(695, 3),
(696, 3),
(697, 3),
(698, 3),
(699, 3),
(700, 3),
(701, 3),
(702, 3),
(703, 3),
(704, 3),
(705, 3),
(706, 3),
(707, 3),
(708, 3),
(709, 3),
(710, 3),
(711, 3),
(712, 3),
(713, 3),
(714, 3),
(715, 3),
(716, 3),
(717, 3),
(718, 3),
(719, 3),
(720, 3),
(721, 3),
(722, 3),
(723, 3),
(724, 3),
(725, 3),
(726, 3),
(727, 3),
(728, 3),
(729, 3),
(730, 3),
(731, 3),
(732, 3),
(733, 3),
(734, 3),
(735, 3),
(736, 3),
(737, 3),
(738, 3),
(739, 3),
(740, 3),
(741, 3),
(742, 3),
(743, 3),
(744, 3),
(745, 3),
(746, 3),
(747, 3),
(748, 3),
(749, 3),
(750, 3),
(751, 3),
(752, 3),
(753, 3),
(754, 3),
(755, 3),
(756, 3),
(757, 3),
(758, 3),
(759, 3),
(760, 3),
(761, 3),
(762, 3),
(763, 3),
(764, 3),
(765, 3),
(766, 3),
(767, 3),
(768, 3),
(769, 3),
(770, 3),
(771, 3),
(772, 3),
(773, 3),
(774, 3),
(775, 3),
(776, 3),
(777, 3),
(778, 3),
(779, 3),
(780, 3),
(781, 3),
(782, 3),
(783, 3),
(784, 3),
(785, 3),
(786, 3),
(787, 3),
(788, 3),
(789, 3),
(790, 3),
(791, 3),
(792, 3),
(793, 3),
(794, 3),
(795, 3),
(796, 3),
(797, 3),
(798, 3),
(0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) DEFAULT NULL,
  `row` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2025-08-26 16:03:21', '2025-08-26 16:03:21'),
(2, NULL, 'DUMMY', 2, 1, '2025-08-26 16:48:38', '2025-08-26 16:48:38'),
(3, NULL, 'DUMMY', 3, 1, '2025-08-27 14:01:08', '2025-08-27 14:01:08'),
(4, NULL, 'DUMMY', 4, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(5, NULL, 'DUMMY', 5, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(6, NULL, 'DUMMY', 6, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(7, NULL, 'DUMMY', 7, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(8, NULL, 'DUMMY', 8, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(9, NULL, 'DUMMY', 9, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(10, NULL, 'DUMMY', 10, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(11, NULL, 'DUMMY', 11, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(12, NULL, 'DUMMY', 12, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(13, NULL, 'DUMMY', 13, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(14, NULL, 'DUMMY', 14, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(15, NULL, 'DUMMY', 15, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(16, NULL, 'DUMMY', 16, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(17, NULL, 'DUMMY', 17, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(18, NULL, 'DUMMY', 18, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(19, NULL, 'DUMMY', 19, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(20, NULL, 'DUMMY', 20, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(21, NULL, 'DUMMY', 21, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(22, NULL, 'DUMMY', 22, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(23, NULL, 'DUMMY', 23, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(24, NULL, 'DUMMY', 24, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(25, NULL, 'DUMMY', 25, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(26, NULL, 'DUMMY', 26, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(27, NULL, 'DUMMY', 27, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(28, NULL, 'DUMMY', 28, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(29, NULL, 'DUMMY', 29, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(30, NULL, 'DUMMY', 30, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(31, NULL, 'DUMMY', 31, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(32, NULL, 'DUMMY', 32, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(33, NULL, 'DUMMY', 33, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(34, NULL, 'DUMMY', 34, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(35, NULL, 'DUMMY', 35, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(36, NULL, 'DUMMY', 36, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(37, NULL, 'DUMMY', 37, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(38, NULL, 'DUMMY', 38, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(39, NULL, 'DUMMY', 39, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(40, NULL, 'DUMMY', 40, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(41, NULL, 'DUMMY', 41, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(42, NULL, 'DUMMY', 42, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(43, NULL, 'DUMMY', 43, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(44, NULL, 'DUMMY', 44, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(45, NULL, 'DUMMY', 45, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(46, NULL, 'DUMMY', 46, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(47, NULL, 'DUMMY', 47, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(48, NULL, 'DUMMY', 48, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(49, NULL, 'DUMMY', 49, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(50, NULL, 'DUMMY', 50, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(51, NULL, 'DUMMY', 51, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(52, NULL, 'DUMMY', 52, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(53, NULL, 'DUMMY', 53, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(54, NULL, 'DUMMY', 54, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(55, NULL, 'DUMMY', 55, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(56, NULL, 'DUMMY', 56, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(57, NULL, 'DUMMY', 57, 1, '2025-09-25 16:52:37', '2025-09-25 16:52:37'),
(58, NULL, 'DUMMY', 58, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(59, NULL, 'DUMMY', 59, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(60, NULL, 'DUMMY', 60, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(61, NULL, 'DUMMY', 61, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(62, NULL, 'DUMMY', 62, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(63, NULL, 'DUMMY', 63, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(64, NULL, 'DUMMY', 64, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(65, NULL, 'DUMMY', 65, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(66, NULL, 'DUMMY', 66, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(67, NULL, 'DUMMY', 67, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(68, NULL, 'DUMMY', 68, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(69, NULL, 'DUMMY', 69, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(70, NULL, 'DUMMY', 70, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(71, NULL, 'DUMMY', 71, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(72, NULL, 'DUMMY', 72, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(73, NULL, 'DUMMY', 73, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(74, NULL, 'DUMMY', 74, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(75, NULL, 'DUMMY', 75, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(76, NULL, 'DUMMY', 76, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(77, NULL, 'DUMMY', 77, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(78, NULL, 'DUMMY', 78, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(79, NULL, 'DUMMY', 79, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(80, NULL, 'DUMMY', 80, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(81, NULL, 'DUMMY', 81, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(82, NULL, 'DUMMY', 82, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(83, NULL, 'DUMMY', 83, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(84, NULL, 'DUMMY', 84, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(85, NULL, 'DUMMY', 85, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(86, NULL, 'DUMMY', 86, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(87, NULL, 'DUMMY', 87, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(88, NULL, 'DUMMY', 88, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(89, NULL, 'DUMMY', 89, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(90, NULL, 'DUMMY', 90, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(91, NULL, 'DUMMY', 91, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(92, NULL, 'DUMMY', 92, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(93, NULL, 'DUMMY', 93, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(94, NULL, 'DUMMY', 94, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(95, NULL, 'DUMMY', 95, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(96, NULL, 'DUMMY', 96, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(97, NULL, 'DUMMY', 97, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(98, NULL, 'DUMMY', 98, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(99, NULL, 'DUMMY', 99, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(100, NULL, 'DUMMY', 100, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(101, NULL, 'DUMMY', 101, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(102, NULL, 'DUMMY', 102, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(103, NULL, 'DUMMY', 103, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(105, NULL, 'DUMMY', 105, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(106, NULL, 'DUMMY', 106, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(107, NULL, 'DUMMY', 107, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(108, NULL, 'DUMMY', 108, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(109, NULL, 'DUMMY', 109, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(110, NULL, 'DUMMY', 110, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(111, NULL, 'DUMMY', 111, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(112, NULL, 'DUMMY', 112, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(113, NULL, 'DUMMY', 113, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(114, NULL, 'DUMMY', 114, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(115, NULL, 'DUMMY', 115, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(116, NULL, 'DUMMY', 116, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(117, NULL, 'DUMMY', 117, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(118, NULL, 'DUMMY', 118, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(119, NULL, 'DUMMY', 119, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(120, NULL, 'DUMMY', 120, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(121, NULL, 'DUMMY', 121, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(122, NULL, 'DUMMY', 122, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(123, NULL, 'DUMMY', 123, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(124, NULL, 'DUMMY', 124, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(125, NULL, 'DUMMY', 125, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(126, NULL, 'DUMMY', 126, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(127, NULL, 'DUMMY', 127, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(128, NULL, 'DUMMY', 128, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(129, NULL, 'DUMMY', 129, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(130, NULL, 'DUMMY', 130, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(131, NULL, 'DUMMY', 131, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(132, NULL, 'DUMMY', 132, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(133, NULL, 'DUMMY', 133, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(134, NULL, 'DUMMY', 134, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(135, NULL, 'DUMMY', 135, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(136, NULL, 'DUMMY', 136, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(137, NULL, 'DUMMY', 137, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(138, NULL, 'DUMMY', 138, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(139, NULL, 'DUMMY', 139, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(140, NULL, 'DUMMY', 140, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(141, NULL, 'DUMMY', 141, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(142, NULL, 'DUMMY', 142, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(143, NULL, 'DUMMY', 143, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(144, NULL, 'DUMMY', 144, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(145, NULL, 'DUMMY', 145, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(146, NULL, 'DUMMY', 146, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(147, NULL, 'DUMMY', 147, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(148, NULL, 'DUMMY', 148, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(149, NULL, 'DUMMY', 149, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(150, NULL, 'DUMMY', 150, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(151, NULL, 'DUMMY', 151, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(152, NULL, 'DUMMY', 152, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(153, NULL, 'DUMMY', 153, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(154, NULL, 'DUMMY', 154, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(155, NULL, 'DUMMY', 155, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(156, NULL, 'DUMMY', 156, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(157, NULL, 'DUMMY', 157, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(158, NULL, 'DUMMY', 158, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(159, NULL, 'DUMMY', 159, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(160, NULL, 'DUMMY', 160, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(161, NULL, 'DUMMY', 161, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(162, NULL, 'DUMMY', 162, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(163, NULL, 'DUMMY', 163, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(164, NULL, 'DUMMY', 164, 1, '2026-02-02 09:40:16', '2026-02-02 09:40:16'),
(165, NULL, 'DUMMY', 165, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(166, NULL, 'DUMMY', 166, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(167, NULL, 'DUMMY', 167, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(168, NULL, 'DUMMY', 168, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(169, NULL, 'DUMMY', 169, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(170, NULL, 'DUMMY', 170, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(171, NULL, 'DUMMY', 171, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(172, NULL, 'DUMMY', 172, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(173, NULL, 'DUMMY', 173, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(174, NULL, 'DUMMY', 174, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(175, NULL, 'DUMMY', 175, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(176, NULL, 'DUMMY', 176, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(177, NULL, 'DUMMY', 177, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(178, NULL, 'DUMMY', 178, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(179, NULL, 'DUMMY', 179, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(180, NULL, 'DUMMY', 180, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(181, NULL, 'DUMMY', 181, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(182, NULL, 'DUMMY', 182, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(183, NULL, 'DUMMY', 183, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(184, NULL, 'DUMMY', 184, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(185, NULL, 'DUMMY', 185, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(186, NULL, 'DUMMY', 186, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(187, NULL, 'DUMMY', 187, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(188, NULL, 'DUMMY', 188, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(189, NULL, 'DUMMY', 189, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(190, NULL, 'DUMMY', 190, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(191, NULL, 'DUMMY', 191, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(192, NULL, 'DUMMY', 192, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(193, NULL, 'DUMMY', 193, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(194, NULL, 'DUMMY', 194, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(195, NULL, 'DUMMY', 195, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(196, NULL, 'DUMMY', 196, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(197, NULL, 'DUMMY', 197, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(198, NULL, 'DUMMY', 198, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(199, NULL, 'DUMMY', 199, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(200, NULL, 'DUMMY', 200, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(201, NULL, 'DUMMY', 201, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(202, NULL, 'DUMMY', 202, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(203, NULL, 'DUMMY', 203, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(204, NULL, 'DUMMY', 204, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(205, NULL, 'DUMMY', 205, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(206, NULL, 'DUMMY', 206, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(207, NULL, 'DUMMY', 207, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(208, NULL, 'DUMMY', 208, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(209, NULL, 'DUMMY', 209, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(210, NULL, 'DUMMY', 210, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(211, NULL, 'DUMMY', 211, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(212, NULL, 'DUMMY', 212, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(213, NULL, 'DUMMY', 213, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(214, NULL, 'DUMMY', 214, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(215, NULL, 'DUMMY', 215, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(216, NULL, 'DUMMY', 216, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(217, NULL, 'DUMMY', 217, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(218, NULL, 'DUMMY', 218, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(219, NULL, 'DUMMY', 219, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(221, NULL, 'DUMMY', 221, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(222, NULL, 'DUMMY', 222, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(223, NULL, 'DUMMY', 223, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(224, NULL, 'DUMMY', 224, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(225, NULL, 'DUMMY', 225, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(226, NULL, 'DUMMY', 226, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(227, NULL, 'DUMMY', 227, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(228, NULL, 'DUMMY', 228, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(230, NULL, 'DUMMY', 230, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(231, NULL, 'DUMMY', 231, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(232, NULL, 'DUMMY', 232, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(233, NULL, 'DUMMY', 233, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(234, NULL, 'DUMMY', 234, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(235, NULL, 'DUMMY', 235, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(236, NULL, 'DUMMY', 236, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(237, NULL, 'DUMMY', 237, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(238, NULL, 'DUMMY', 238, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(239, NULL, 'DUMMY', 239, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(240, NULL, 'DUMMY', 240, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(241, NULL, 'DUMMY', 241, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(242, NULL, 'DUMMY', 242, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(243, NULL, 'DUMMY', 243, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(244, NULL, 'DUMMY', 244, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(245, NULL, 'DUMMY', 245, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(246, NULL, 'DUMMY', 246, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(247, NULL, 'DUMMY', 247, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(248, NULL, 'DUMMY', 248, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(249, NULL, 'DUMMY', 249, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(250, NULL, 'DUMMY', 250, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(251, NULL, 'DUMMY', 251, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(252, NULL, 'DUMMY', 252, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(253, NULL, 'DUMMY', 253, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(254, NULL, 'DUMMY', 254, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(255, NULL, 'DUMMY', 255, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(256, NULL, 'DUMMY', 256, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(257, NULL, 'DUMMY', 257, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(258, NULL, 'DUMMY', 258, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(259, NULL, 'DUMMY', 259, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(260, NULL, 'DUMMY', 260, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(261, NULL, 'DUMMY', 261, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(262, NULL, 'DUMMY', 262, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(263, NULL, 'DUMMY', 263, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(264, NULL, 'DUMMY', 264, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(265, NULL, 'DUMMY', 265, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(266, NULL, 'DUMMY', 266, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(267, NULL, 'DUMMY', 267, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(268, NULL, 'DUMMY', 268, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(269, NULL, 'DUMMY', 269, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(270, NULL, 'DUMMY', 270, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(271, NULL, 'DUMMY', 271, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(272, NULL, 'DUMMY', 272, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(274, NULL, 'DUMMY', 274, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(277, NULL, 'DUMMY', 277, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(278, NULL, 'DUMMY', 278, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(279, NULL, 'DUMMY', 279, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(280, NULL, 'DUMMY', 280, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(281, NULL, 'DUMMY', 281, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(282, NULL, 'DUMMY', 282, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(283, NULL, 'DUMMY', 283, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(284, NULL, 'DUMMY', 284, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(286, NULL, 'DUMMY', 286, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(288, NULL, 'DUMMY', 288, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(289, NULL, 'DUMMY', 289, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(290, NULL, 'DUMMY', 290, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(291, NULL, 'DUMMY', 291, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(292, NULL, 'DUMMY', 292, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(293, NULL, 'DUMMY', 293, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(294, NULL, 'DUMMY', 294, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(295, NULL, 'DUMMY', 295, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(296, NULL, 'DUMMY', 296, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(297, NULL, 'DUMMY', 297, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(298, NULL, 'DUMMY', 298, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(299, NULL, 'DUMMY', 299, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(300, NULL, 'DUMMY', 300, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(301, NULL, 'DUMMY', 301, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(302, NULL, 'DUMMY', 302, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(303, NULL, 'DUMMY', 303, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(304, NULL, 'DUMMY', 304, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(305, NULL, 'DUMMY', 305, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(306, NULL, 'DUMMY', 306, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(307, NULL, 'DUMMY', 307, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(308, NULL, 'DUMMY', 308, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(309, NULL, 'DUMMY', 309, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(310, NULL, 'DUMMY', 310, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(311, NULL, 'DUMMY', 311, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(312, NULL, 'DUMMY', 312, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(313, NULL, 'DUMMY', 313, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(314, NULL, 'DUMMY', 314, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(315, NULL, 'DUMMY', 315, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(316, NULL, 'DUMMY', 316, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(317, NULL, 'DUMMY', 317, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(318, NULL, 'DUMMY', 318, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(319, NULL, 'DUMMY', 319, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(320, NULL, 'DUMMY', 320, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(321, NULL, 'DUMMY', 321, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(322, NULL, 'DUMMY', 322, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(323, NULL, 'DUMMY', 323, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(324, NULL, 'DUMMY', 324, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(325, NULL, 'DUMMY', 325, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(326, NULL, 'DUMMY', 326, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(327, NULL, 'DUMMY', 327, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(328, NULL, 'DUMMY', 328, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(329, NULL, 'DUMMY', 329, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(330, NULL, 'DUMMY', 330, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(331, NULL, 'DUMMY', 331, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(332, NULL, 'DUMMY', 332, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(333, NULL, 'DUMMY', 333, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(334, NULL, 'DUMMY', 334, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(335, NULL, 'DUMMY', 335, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(336, NULL, 'DUMMY', 336, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(337, NULL, 'DUMMY', 337, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(338, NULL, 'DUMMY', 338, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(339, NULL, 'DUMMY', 339, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(340, NULL, 'DUMMY', 340, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(341, NULL, 'DUMMY', 341, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(342, NULL, 'DUMMY', 342, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(343, NULL, 'DUMMY', 343, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(344, NULL, 'DUMMY', 344, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(345, NULL, 'DUMMY', 345, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(346, NULL, 'DUMMY', 346, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(347, NULL, 'DUMMY', 347, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(348, NULL, 'DUMMY', 348, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(349, NULL, 'DUMMY', 349, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(350, NULL, 'DUMMY', 350, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(351, NULL, 'DUMMY', 351, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(352, NULL, 'DUMMY', 352, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(353, NULL, 'DUMMY', 353, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(354, NULL, 'DUMMY', 354, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(355, NULL, 'DUMMY', 355, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(356, NULL, 'DUMMY', 356, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(357, NULL, 'DUMMY', 357, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(358, NULL, 'DUMMY', 358, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(359, NULL, 'DUMMY', 359, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(360, NULL, 'DUMMY', 360, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(361, NULL, 'DUMMY', 361, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(362, NULL, 'DUMMY', 362, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(363, NULL, 'DUMMY', 363, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(364, NULL, 'DUMMY', 364, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(365, NULL, 'DUMMY', 365, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(366, NULL, 'DUMMY', 366, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(367, NULL, 'DUMMY', 367, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(368, NULL, 'DUMMY', 368, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(369, NULL, 'DUMMY', 369, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(370, NULL, 'DUMMY', 370, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(371, NULL, 'DUMMY', 371, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(372, NULL, 'DUMMY', 372, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(373, NULL, 'DUMMY', 373, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(374, NULL, 'DUMMY', 374, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(375, NULL, 'DUMMY', 375, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(376, NULL, 'DUMMY', 376, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(377, NULL, 'DUMMY', 377, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(378, NULL, 'DUMMY', 378, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(379, NULL, 'DUMMY', 379, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(380, NULL, 'DUMMY', 380, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(381, NULL, 'DUMMY', 381, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(382, NULL, 'DUMMY', 382, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(383, NULL, 'DUMMY', 383, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(384, NULL, 'DUMMY', 384, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(385, NULL, 'DUMMY', 385, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(386, NULL, 'DUMMY', 386, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(387, NULL, 'DUMMY', 387, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(388, NULL, 'DUMMY', 388, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(389, NULL, 'DUMMY', 389, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(390, NULL, 'DUMMY', 390, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(391, NULL, 'DUMMY', 391, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(392, NULL, 'DUMMY', 392, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(393, NULL, 'DUMMY', 393, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(394, NULL, 'DUMMY', 394, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(395, NULL, 'DUMMY', 395, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(396, NULL, 'DUMMY', 396, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(397, NULL, 'DUMMY', 397, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(398, NULL, 'DUMMY', 398, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(399, NULL, 'DUMMY', 399, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(400, NULL, 'DUMMY', 400, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(401, NULL, 'DUMMY', 401, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(402, NULL, 'DUMMY', 402, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(403, NULL, 'DUMMY', 403, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(404, NULL, 'DUMMY', 404, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(405, NULL, 'DUMMY', 405, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(406, NULL, 'DUMMY', 406, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(407, NULL, 'DUMMY', 407, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(408, NULL, 'DUMMY', 408, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(409, NULL, 'DUMMY', 409, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(410, NULL, 'DUMMY', 410, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(411, NULL, 'DUMMY', 411, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(412, NULL, 'DUMMY', 412, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(413, NULL, 'DUMMY', 413, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(414, NULL, 'DUMMY', 414, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(415, NULL, 'DUMMY', 415, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(416, NULL, 'DUMMY', 416, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(417, NULL, 'DUMMY', 417, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(418, NULL, 'DUMMY', 418, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(419, NULL, 'DUMMY', 419, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(420, NULL, 'DUMMY', 420, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(421, NULL, 'DUMMY', 421, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(422, NULL, 'DUMMY', 422, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(423, NULL, 'DUMMY', 423, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(424, NULL, 'DUMMY', 424, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(425, NULL, 'DUMMY', 425, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(426, NULL, 'DUMMY', 426, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(427, NULL, 'DUMMY', 427, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(428, NULL, 'DUMMY', 428, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(430, NULL, 'DUMMY', 430, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(431, NULL, 'DUMMY', 431, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(432, NULL, 'DUMMY', 432, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(433, NULL, 'DUMMY', 433, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(434, NULL, 'DUMMY', 434, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(435, NULL, 'DUMMY', 435, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(436, NULL, 'DUMMY', 436, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(437, NULL, 'DUMMY', 437, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(438, NULL, 'DUMMY', 438, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(439, NULL, 'DUMMY', 439, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(440, NULL, 'DUMMY', 440, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(441, NULL, 'DUMMY', 441, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(442, NULL, 'DUMMY', 442, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(443, NULL, 'DUMMY', 443, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(444, NULL, 'DUMMY', 444, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(445, NULL, 'DUMMY', 445, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(446, NULL, 'DUMMY', 446, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(447, NULL, 'DUMMY', 447, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(448, NULL, 'DUMMY', 448, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(449, NULL, 'DUMMY', 449, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(450, NULL, 'DUMMY', 450, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(451, NULL, 'DUMMY', 451, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(452, NULL, 'DUMMY', 452, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(453, NULL, 'DUMMY', 453, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(454, NULL, 'DUMMY', 454, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(455, NULL, 'DUMMY', 455, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(456, NULL, 'DUMMY', 456, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(457, NULL, 'DUMMY', 457, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(458, NULL, 'DUMMY', 458, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(459, NULL, 'DUMMY', 459, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(460, NULL, 'DUMMY', 460, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(461, NULL, 'DUMMY', 461, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(462, NULL, 'DUMMY', 462, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(463, NULL, 'DUMMY', 463, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(464, NULL, 'DUMMY', 464, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(465, NULL, 'DUMMY', 465, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(466, NULL, 'DUMMY', 466, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(467, NULL, 'DUMMY', 467, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(468, NULL, 'DUMMY', 468, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(469, NULL, 'DUMMY', 469, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(470, NULL, 'DUMMY', 470, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(471, NULL, 'DUMMY', 471, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(472, NULL, 'DUMMY', 472, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(473, NULL, 'DUMMY', 473, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(474, NULL, 'DUMMY', 474, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(475, NULL, 'DUMMY', 475, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(476, NULL, 'DUMMY', 476, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(477, NULL, 'DUMMY', 477, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(478, NULL, 'DUMMY', 478, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(479, NULL, 'DUMMY', 479, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(480, NULL, 'DUMMY', 480, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(481, NULL, 'DUMMY', 481, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(482, NULL, 'DUMMY', 482, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(483, NULL, 'DUMMY', 483, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(484, NULL, 'DUMMY', 484, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(485, NULL, 'DUMMY', 485, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(486, NULL, 'DUMMY', 486, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(487, NULL, 'DUMMY', 487, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(488, NULL, 'DUMMY', 488, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(489, NULL, 'DUMMY', 489, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(490, NULL, 'DUMMY', 490, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(492, NULL, 'DUMMY', 492, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(493, NULL, 'DUMMY', 493, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(494, NULL, 'DUMMY', 494, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(495, NULL, 'DUMMY', 495, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(496, NULL, 'DUMMY', 496, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(497, NULL, 'DUMMY', 497, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(498, NULL, 'DUMMY', 498, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(499, NULL, 'DUMMY', 499, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(500, NULL, 'DUMMY', 500, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(501, NULL, 'DUMMY', 501, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(502, NULL, 'DUMMY', 502, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(503, NULL, 'DUMMY', 503, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(504, NULL, 'DUMMY', 504, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(505, NULL, 'DUMMY', 505, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(506, NULL, 'DUMMY', 506, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(507, NULL, 'DUMMY', 507, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(508, NULL, 'DUMMY', 508, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(509, NULL, 'DUMMY', 509, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(510, NULL, 'DUMMY', 510, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(511, NULL, 'DUMMY', 511, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(512, NULL, 'DUMMY', 512, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(513, NULL, 'DUMMY', 513, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(514, NULL, 'DUMMY', 514, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(515, NULL, 'DUMMY', 515, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(516, NULL, 'DUMMY', 516, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(517, NULL, 'DUMMY', 517, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(518, NULL, 'DUMMY', 518, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(519, NULL, 'DUMMY', 519, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(520, NULL, 'DUMMY', 520, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(521, NULL, 'DUMMY', 521, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(522, NULL, 'DUMMY', 522, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(523, NULL, 'DUMMY', 523, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(524, NULL, 'DUMMY', 524, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(525, NULL, 'DUMMY', 525, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(526, NULL, 'DUMMY', 526, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(527, NULL, 'DUMMY', 527, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(528, NULL, 'DUMMY', 528, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(529, NULL, 'DUMMY', 529, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(530, NULL, 'DUMMY', 530, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(531, NULL, 'DUMMY', 531, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(532, NULL, 'DUMMY', 532, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(533, NULL, 'DUMMY', 533, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(534, NULL, 'DUMMY', 534, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(535, NULL, 'DUMMY', 535, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(536, NULL, 'DUMMY', 536, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(537, NULL, 'DUMMY', 537, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(538, NULL, 'DUMMY', 538, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(539, NULL, 'DUMMY', 539, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(540, NULL, 'DUMMY', 540, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(541, NULL, 'DUMMY', 541, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(542, NULL, 'DUMMY', 542, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(543, NULL, 'DUMMY', 543, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(544, NULL, 'DUMMY', 544, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(545, NULL, 'DUMMY', 545, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(546, NULL, 'DUMMY', 546, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(547, NULL, 'DUMMY', 547, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(548, NULL, 'DUMMY', 548, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(549, NULL, 'DUMMY', 549, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(550, NULL, 'DUMMY', 550, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(551, NULL, 'DUMMY', 551, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(552, NULL, 'DUMMY', 552, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(553, NULL, 'DUMMY', 553, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(554, NULL, 'DUMMY', 554, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(555, NULL, 'DUMMY', 555, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(556, NULL, 'DUMMY', 556, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(557, NULL, 'DUMMY', 557, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(558, NULL, 'DUMMY', 558, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(559, NULL, 'DUMMY', 559, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(560, NULL, 'DUMMY', 560, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(561, NULL, 'DUMMY', 561, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(562, NULL, 'DUMMY', 562, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(563, NULL, 'DUMMY', 563, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(564, NULL, 'DUMMY', 564, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(565, NULL, 'DUMMY', 565, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(566, NULL, 'DUMMY', 566, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(567, NULL, 'DUMMY', 567, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(568, NULL, 'DUMMY', 568, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(569, NULL, 'DUMMY', 569, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(570, NULL, 'DUMMY', 570, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(571, NULL, 'DUMMY', 571, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(572, NULL, 'DUMMY', 572, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(573, NULL, 'DUMMY', 573, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(574, NULL, 'DUMMY', 574, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(575, NULL, 'DUMMY', 575, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(576, NULL, 'DUMMY', 576, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(577, NULL, 'DUMMY', 577, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(578, NULL, 'DUMMY', 578, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(579, NULL, 'DUMMY', 579, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(580, NULL, 'DUMMY', 580, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(581, NULL, 'DUMMY', 581, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(582, NULL, 'DUMMY', 582, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(583, NULL, 'DUMMY', 583, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(584, NULL, 'DUMMY', 584, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(585, NULL, 'DUMMY', 585, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(586, NULL, 'DUMMY', 586, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(587, NULL, 'DUMMY', 587, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(588, NULL, 'DUMMY', 588, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(589, NULL, 'DUMMY', 589, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(590, NULL, 'DUMMY', 590, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(591, NULL, 'DUMMY', 591, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(592, NULL, 'DUMMY', 592, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(593, NULL, 'DUMMY', 593, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(594, NULL, 'DUMMY', 594, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(595, NULL, 'DUMMY', 595, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(596, NULL, 'DUMMY', 596, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(597, NULL, 'DUMMY', 597, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(598, NULL, 'DUMMY', 598, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(599, NULL, 'DUMMY', 599, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(600, NULL, 'DUMMY', 600, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(601, NULL, 'DUMMY', 601, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(602, NULL, 'DUMMY', 602, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(603, NULL, 'DUMMY', 603, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(604, NULL, 'DUMMY', 604, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(605, NULL, 'DUMMY', 605, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(606, NULL, 'DUMMY', 606, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(607, NULL, 'DUMMY', 607, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(608, NULL, 'DUMMY', 608, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(609, NULL, 'DUMMY', 609, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(610, NULL, 'DUMMY', 610, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(611, NULL, 'DUMMY', 611, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(612, NULL, 'DUMMY', 612, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(613, NULL, 'DUMMY', 613, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(614, NULL, 'DUMMY', 614, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(615, NULL, 'DUMMY', 615, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(616, NULL, 'DUMMY', 616, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(617, NULL, 'DUMMY', 617, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(618, NULL, 'DUMMY', 618, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(619, NULL, 'DUMMY', 619, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(620, NULL, 'DUMMY', 620, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(621, NULL, 'DUMMY', 621, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(622, NULL, 'DUMMY', 622, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(623, NULL, 'DUMMY', 623, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(624, NULL, 'DUMMY', 624, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(625, NULL, 'DUMMY', 625, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(626, NULL, 'DUMMY', 626, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(627, NULL, 'DUMMY', 627, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(628, NULL, 'DUMMY', 628, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(629, NULL, 'DUMMY', 629, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(630, NULL, 'DUMMY', 630, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(631, NULL, 'DUMMY', 631, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(632, NULL, 'DUMMY', 632, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(633, NULL, 'DUMMY', 633, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(634, NULL, 'DUMMY', 634, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(635, NULL, 'DUMMY', 635, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(636, NULL, 'DUMMY', 636, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(637, NULL, 'DUMMY', 637, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(638, NULL, 'DUMMY', 638, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(639, NULL, 'DUMMY', 639, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(640, NULL, 'DUMMY', 640, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(641, NULL, 'DUMMY', 641, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(642, NULL, 'DUMMY', 642, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(643, NULL, 'DUMMY', 643, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(644, NULL, 'DUMMY', 644, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(645, NULL, 'DUMMY', 645, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(646, NULL, 'DUMMY', 646, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(647, NULL, 'DUMMY', 647, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(648, NULL, 'DUMMY', 648, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(649, NULL, 'DUMMY', 649, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(650, NULL, 'DUMMY', 650, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(651, NULL, 'DUMMY', 651, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(652, NULL, 'DUMMY', 652, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(653, NULL, 'DUMMY', 653, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(654, NULL, 'DUMMY', 654, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(655, NULL, 'DUMMY', 655, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(656, NULL, 'DUMMY', 656, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(657, NULL, 'DUMMY', 657, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(658, NULL, 'DUMMY', 658, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(659, NULL, 'DUMMY', 659, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(660, NULL, 'DUMMY', 660, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(661, NULL, 'DUMMY', 661, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(662, NULL, 'DUMMY', 662, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(663, NULL, 'DUMMY', 663, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(664, NULL, 'DUMMY', 664, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(665, NULL, 'DUMMY', 665, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(666, NULL, 'DUMMY', 666, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(667, NULL, 'DUMMY', 667, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(668, NULL, 'DUMMY', 668, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(669, NULL, 'DUMMY', 669, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(670, NULL, 'DUMMY', 670, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(671, NULL, 'DUMMY', 671, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(672, NULL, 'DUMMY', 672, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(673, NULL, 'DUMMY', 673, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(674, NULL, 'DUMMY', 674, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(675, NULL, 'DUMMY', 675, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(676, NULL, 'DUMMY', 676, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(677, NULL, 'DUMMY', 677, 1, '2026-02-02 09:40:17', '2026-02-02 09:40:17'),
(678, NULL, 'DUMMY', 678, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(679, NULL, 'DUMMY', 679, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(680, NULL, 'DUMMY', 680, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(681, NULL, 'DUMMY', 681, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(682, NULL, 'DUMMY', 682, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(683, NULL, 'DUMMY', 683, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(684, NULL, 'DUMMY', 684, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(685, NULL, 'DUMMY', 685, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(686, NULL, 'DUMMY', 686, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18');
INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(687, NULL, 'DUMMY', 687, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(688, NULL, 'DUMMY', 688, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(689, NULL, 'DUMMY', 689, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(690, NULL, 'DUMMY', 690, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(691, NULL, 'DUMMY', 691, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(692, NULL, 'DUMMY', 692, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(693, NULL, 'DUMMY', 693, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(694, NULL, 'DUMMY', 694, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(695, NULL, 'DUMMY', 695, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(696, NULL, 'DUMMY', 696, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(697, NULL, 'DUMMY', 697, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(698, NULL, 'DUMMY', 698, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(699, NULL, 'DUMMY', 699, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(700, NULL, 'DUMMY', 700, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(702, NULL, 'DUMMY', 702, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(703, NULL, 'DUMMY', 703, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(704, NULL, 'DUMMY', 704, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(705, NULL, 'DUMMY', 705, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(706, NULL, 'DUMMY', 706, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(707, NULL, 'DUMMY', 707, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(708, NULL, 'DUMMY', 708, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(709, NULL, 'DUMMY', 709, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(710, NULL, 'DUMMY', 710, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(711, NULL, 'DUMMY', 711, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(712, NULL, 'DUMMY', 712, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(713, NULL, 'DUMMY', 713, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(714, NULL, 'DUMMY', 714, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(715, NULL, 'DUMMY', 715, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(716, NULL, 'DUMMY', 716, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(717, NULL, 'DUMMY', 717, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(718, NULL, 'DUMMY', 718, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(719, NULL, 'DUMMY', 719, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(720, NULL, 'DUMMY', 720, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(721, NULL, 'DUMMY', 721, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(722, NULL, 'DUMMY', 722, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(723, NULL, 'DUMMY', 723, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(724, NULL, 'DUMMY', 724, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(725, NULL, 'DUMMY', 725, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(726, NULL, 'DUMMY', 726, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(727, NULL, 'DUMMY', 727, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(728, NULL, 'DUMMY', 728, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(729, NULL, 'DUMMY', 729, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(730, NULL, 'DUMMY', 730, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(731, NULL, 'DUMMY', 731, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(732, NULL, 'DUMMY', 732, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(733, NULL, 'DUMMY', 733, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(734, NULL, 'DUMMY', 734, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(735, NULL, 'DUMMY', 735, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(736, NULL, 'DUMMY', 736, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(737, NULL, 'DUMMY', 737, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(738, NULL, 'DUMMY', 738, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(739, NULL, 'DUMMY', 739, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(740, NULL, 'DUMMY', 740, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(741, NULL, 'DUMMY', 741, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(742, NULL, 'DUMMY', 742, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(743, NULL, 'DUMMY', 743, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(744, NULL, 'DUMMY', 744, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(745, NULL, 'DUMMY', 745, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(746, NULL, 'DUMMY', 746, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(747, NULL, 'DUMMY', 747, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(748, NULL, 'DUMMY', 748, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(749, NULL, 'DUMMY', 749, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(750, NULL, 'DUMMY', 750, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(751, NULL, 'DUMMY', 751, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(752, NULL, 'DUMMY', 752, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(753, NULL, 'DUMMY', 753, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(754, NULL, 'DUMMY', 754, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(755, NULL, 'DUMMY', 755, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(756, NULL, 'DUMMY', 756, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(757, NULL, 'DUMMY', 757, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(758, NULL, 'DUMMY', 758, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(759, NULL, 'DUMMY', 759, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(760, NULL, 'DUMMY', 760, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(761, NULL, 'DUMMY', 761, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(763, NULL, 'DUMMY', 763, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(764, NULL, 'DUMMY', 764, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(765, NULL, 'DUMMY', 765, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(766, NULL, 'DUMMY', 766, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(767, NULL, 'DUMMY', 767, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(768, NULL, 'DUMMY', 768, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(769, NULL, 'DUMMY', 769, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(770, NULL, 'DUMMY', 770, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(771, NULL, 'DUMMY', 771, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(772, NULL, 'DUMMY', 772, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(773, NULL, 'DUMMY', 773, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(774, NULL, 'DUMMY', 774, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(775, NULL, 'DUMMY', 775, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(776, NULL, 'DUMMY', 776, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(777, NULL, 'DUMMY', 777, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(778, NULL, 'DUMMY', 778, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(779, NULL, 'DUMMY', 779, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(780, NULL, 'DUMMY', 780, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(781, NULL, 'DUMMY', 781, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(782, NULL, 'DUMMY', 782, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(783, NULL, 'DUMMY', 783, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(784, NULL, 'DUMMY', 784, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(785, NULL, 'DUMMY', 785, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(786, NULL, 'DUMMY', 786, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(787, NULL, 'DUMMY', 787, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(788, NULL, 'DUMMY', 788, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(789, NULL, 'DUMMY', 789, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(790, NULL, 'DUMMY', 790, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(791, NULL, 'DUMMY', 791, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(792, NULL, 'DUMMY', 792, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(793, NULL, 'DUMMY', 793, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(794, NULL, 'DUMMY', 794, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(795, NULL, 'DUMMY', 795, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(796, NULL, 'DUMMY', 796, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(797, NULL, 'DUMMY', 797, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(798, NULL, 'DUMMY', 798, 1, '2026-02-02 09:40:18', '2026-02-02 09:40:18'),
(0, NULL, 'DUMMY', 0, 1, '2026-02-17 02:36:01', '2026-02-17 02:36:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_requisition_line_id` int(11) DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `purchase_requisition_line_id`, `purchase_order_line_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `po_quantity_purchased`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 100.0000, 0.0000, 10.0000, 0.00, 10.0000, 10.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-08-26 16:03:27', '2026-02-17 19:12:26'),
(5, 8, 2, 2, 10.0000, 0.0000, 500.0000, 0.00, 500.0000, 500.0000, 0.0000, NULL, NULL, NULL, 2.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-08-26 16:48:43', '2026-02-17 19:52:49'),
(6, 9, 3, 3, 12.0000, 0.0000, 2600.0000, 0.00, 2600.0000, 2600.0000, 0.0000, NULL, NULL, NULL, 12.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-08-27 14:01:24', '2026-02-17 22:24:24'),
(0, 0, 0, 0, 200.0000, 0.0000, 120.0000, 0.00, 120.0000, 120.0000, 0.0000, NULL, NULL, NULL, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2026-02-17 02:42:51', '2026-02-18 17:09:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 3, 1, '2025-08-27 00:19:38', '2026-02-17 19:28:42'),
(2, 'business_location', 2, 1, '2025-08-27 00:19:38', '2025-08-26 19:46:04'),
(3, 'sell_payment', 64, 1, '2025-08-26 16:08:58', '2026-02-18 17:09:49'),
(4, 'purchase', 3, 1, '2025-08-26 16:11:35', '2025-08-26 16:23:57'),
(5, 'purchase_payment', 3, 1, '2025-08-26 16:11:35', '2025-08-26 16:23:57'),
(6, 'allocation_code', 1, 1, '2025-08-28 09:22:39', '2025-08-28 09:22:39'),
(7, 'revoke_code', 1, 1, '2025-08-28 09:25:34', '2025-08-28 09:25:34'),
(8, 'asset_maintenance', 1, 1, '2025-08-28 09:27:12', '2025-08-28 09:27:12'),
(9, 'contacts', 4, 2, '2026-01-30 13:42:59', '2026-02-01 09:57:41'),
(10, 'business_location', 1, 2, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(11, 'username', 1, 2, '2026-02-02 09:17:26', '2026-02-02 09:17:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2025-08-27 00:19:38', '2025-08-27 00:19:38'),
(3, 'Sepervisor#1', 'web', 1, 0, 0, '2025-10-10 18:59:12', '2025-10-10 18:59:12'),
(4, 'Admin#2', 'web', 2, 1, 0, '2026-01-30 13:42:59', '2026-01-30 13:42:59'),
(5, 'CONTROL DE STOKE#2', 'web', 2, 0, 0, '2026-01-30 13:42:59', '2026-02-01 09:01:41'),
(6, 'CAJERA#2', 'web', 2, 0, 0, '2026-02-01 09:28:48', '2026-02-01 09:28:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(25, 2),
(26, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(83, 2),
(84, 2),
(86, 2),
(97, 2),
(2, 3),
(3, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(15, 3),
(16, 3),
(19, 3),
(20, 3),
(22, 3),
(25, 3),
(26, 3),
(27, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(44, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(56, 3),
(59, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(81, 3),
(99, 3),
(100, 3),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 3),
(110, 3),
(111, 3),
(116, 3),
(117, 3),
(119, 3),
(6, 5),
(7, 5),
(18, 5),
(25, 5),
(26, 5),
(33, 5),
(36, 5),
(40, 5),
(41, 5),
(42, 5),
(48, 5),
(53, 5),
(54, 5),
(56, 5),
(58, 5),
(59, 5),
(61, 5),
(63, 5),
(64, 5),
(65, 5),
(71, 5),
(72, 5),
(75, 5),
(76, 5),
(121, 5),
(122, 5),
(123, 5),
(124, 5),
(125, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '6.7'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_tax_rate_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `journal_entry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_kitchen_order` tinyint(1) NOT NULL DEFAULT 0,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `sub_type` varchar(20) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `sub_status` varchar(191) DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) DEFAULT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `subscription_no` varchar(191) DEFAULT NULL,
  `subscription_repeat_on` varchar(191) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `shipping_status` varchar(191) DEFAULT NULL,
  `delivered_to` varchar(191) DEFAULT NULL,
  `delivery_person` bigint(20) DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `shipping_custom_field_1` varchar(191) DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_fields_info` longtext DEFAULT NULL,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_2` varchar(191) DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_3` varchar(191) DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_4` varchar(191) DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `payment_surcharge` decimal(22,4) DEFAULT 0.0000,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_sub_category_id` int(11) DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `woocommerce_order_id` int(11) DEFAULT NULL,
  `essentials_duration` decimal(8,2) NOT NULL,
  `essentials_duration_unit` varchar(20) DEFAULT NULL,
  `essentials_amount_per_unit_duration` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `essentials_allowances` text DEFAULT NULL,
  `essentials_deductions` text DEFAULT NULL,
  `crm_is_order_request` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_requisition_ids` text DEFAULT NULL,
  `prefer_payment_method` varchar(191) DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text DEFAULT NULL,
  `purchase_order_ids` text DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `service_custom_field_1` text DEFAULT NULL,
  `service_custom_field_2` text DEFAULT NULL,
  `service_custom_field_3` text DEFAULT NULL,
  `service_custom_field_4` text DEFAULT NULL,
  `service_custom_field_5` text DEFAULT NULL,
  `service_custom_field_6` text DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `pjt_project_id` int(10) UNSIGNED DEFAULT NULL,
  `pjt_title` varchar(191) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `journal_entry_id`, `is_kitchen_order`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `delivery_date`, `shipping_status`, `delivered_to`, `delivery_person`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `payment_surcharge`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `woocommerce_order_id`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `crm_is_order_request`, `purchase_requisition_ids`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `pjt_project_id`, `pjt_title`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 16:03:27', 10.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 1, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-26 16:03:27', '2025-08-26 16:03:27'),
(8, 1, 1, NULL, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 16:48:43', 500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5000.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 2, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-26 16:48:43', '2025-08-26 16:48:43'),
(9, 1, 1, NULL, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 14:01:23', 2600.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 31200.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 3, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-27 14:01:24', '2025-08-27 14:01:24'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-24 22:42:00', 120.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24000.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 0, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-17 02:42:51', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0004', '', NULL, NULL, NULL, '2026-02-17 13:54:40', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'dad', 'daadas', 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3512.2500, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 17:54:40', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0005', '', NULL, NULL, NULL, '2026-02-17 14:21:36', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'asdas', 'dasdas', 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 18:21:36', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0006', '', NULL, NULL, NULL, '2026-02-17 14:21:38', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'asdas', 'dasdas', 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 18:21:38', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0007', '', NULL, NULL, NULL, '2026-02-17 14:21:42', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'asdas', 'dasdas', 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 18:21:42', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0008', '', NULL, NULL, NULL, '2026-02-17 15:05:15', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:05:15', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0009', '', NULL, NULL, NULL, '2026-02-17 15:05:17', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:05:17', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0010', '', NULL, NULL, NULL, '2026-02-17 15:06:49', 20.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:06:50', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0011', '', NULL, NULL, NULL, '2026-02-17 15:11:56', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:11:56', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0012', '', NULL, NULL, NULL, '2026-02-17 15:12:00', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:12:00', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0013', '', NULL, NULL, NULL, '2026-02-17 15:12:26', 20.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 20.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:12:26', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0014', '', NULL, NULL, NULL, '2026-02-17 15:14:07', 3000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3000.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:14:07', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0015', '', NULL, NULL, NULL, '2026-02-17 15:16:39', 3000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3000.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:16:39', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0016', '', NULL, NULL, NULL, '2026-02-17 15:16:57', 3000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3010.5000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:16:57', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0017', '', NULL, NULL, NULL, '2026-02-17 15:26:42', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:26:42', '2026-02-17 23:26:31'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0018', '', NULL, NULL, NULL, '2026-02-17 15:28:52', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:28:52', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0019', '', NULL, NULL, NULL, '2026-02-17 15:31:00', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:31:00', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0020', '', NULL, NULL, NULL, '2026-02-17 15:34:12', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:34:12', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0021', '', NULL, NULL, NULL, '2026-02-17 15:37:06', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:37:06', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0022', '', NULL, NULL, NULL, '2026-02-17 15:38:19', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 19:38:19', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0023', '', NULL, NULL, NULL, '2026-02-17 15:38:27', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 19:38:27', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0024', '', NULL, NULL, NULL, '2026-02-17 15:38:33', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 19:38:33', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0025', '', NULL, NULL, NULL, '2026-02-17 15:39:59', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:39:59', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0026', '', NULL, NULL, NULL, '2026-02-17 15:41:53', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:41:53', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0027', '', NULL, NULL, NULL, '2026-02-17 15:48:16', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:48:16', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 9, NULL, '0028', '', NULL, NULL, NULL, '2026-02-17 15:50:01', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:50:01', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0029', '', NULL, NULL, NULL, '2026-02-17 15:51:49', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 19:51:49', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0030', '', NULL, NULL, NULL, '2026-02-17 15:51:59', 3000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3000.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:51:59', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0031', '', NULL, NULL, NULL, '2026-02-17 15:52:48', 3000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3000.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 19:52:48', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0032', '', NULL, NULL, NULL, '2026-02-17 16:41:04', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 20:41:04', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0033', '', NULL, NULL, NULL, '2026-02-17 16:41:14', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 20:41:14', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0034', '', NULL, NULL, NULL, '2026-02-17 16:42:05', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 20:42:05', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0035', '', NULL, NULL, NULL, '2026-02-17 16:42:10', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 20:42:10', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0036', '', NULL, NULL, NULL, '2026-02-17 16:46:13', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 20:46:13', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0037', '', NULL, NULL, NULL, '2026-02-17 16:48:02', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'dad', 'dasdasda', 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 20:48:02', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0038', '', NULL, NULL, NULL, '2026-02-17 16:53:59', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 20:53:59', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0039', '', NULL, NULL, NULL, '2026-02-17 16:54:18', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 20:54:18', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0040', '', NULL, NULL, NULL, '2026-02-17 17:01:27', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 21:01:27', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0041', '', NULL, NULL, NULL, '2026-02-17 17:01:49', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 21:01:49', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0042', '', NULL, NULL, NULL, '2026-02-17 17:05:38', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 21:05:39', '2026-02-17 23:26:31'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0043', '', NULL, NULL, NULL, '2026-02-17 17:23:08', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 21:23:08', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0044', '', NULL, NULL, NULL, '2026-02-17 17:34:56', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 21:34:56', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0045', '', NULL, NULL, NULL, '2026-02-17 17:35:03', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 21:35:03', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0046', '', NULL, NULL, NULL, '2026-02-17 17:35:09', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 21:35:09', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0047', '', NULL, NULL, NULL, '2026-02-17 17:39:54', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 21:39:54', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0048', '', NULL, NULL, NULL, '2026-02-17 17:39:58', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 21:39:58', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0049', '', NULL, NULL, NULL, '2026-02-17 17:40:02', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 21:40:02', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0050', '', NULL, NULL, NULL, '2026-02-17 17:40:07', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 21:40:07', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 7, NULL, '0051', '', NULL, NULL, NULL, '2026-02-17 17:57:37', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 0, 'days', NULL, NULL, 0, '2026-02-17 21:57:38', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0052', '', NULL, NULL, NULL, '2026-02-17 17:59:49', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 21:59:49', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0053', '', NULL, NULL, NULL, '2026-02-17 18:08:19', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 22:08:19', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0054', '', NULL, NULL, NULL, '2026-02-17 18:12:53', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3512.2500, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 22:12:53', '2026-02-17 23:26:31'),
(0, 1, 1, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 9, NULL, '0055', '', NULL, NULL, NULL, '2026-02-17 18:24:22', 3500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3500.0000, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 22:24:22', '2026-02-17 23:26:31'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0056', '', NULL, NULL, NULL, '2026-02-17 19:25:46', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 23:25:46', '2026-02-17 23:26:31'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0057', '', NULL, NULL, NULL, '2026-02-17 19:26:04', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 23:26:04', '2026-02-17 23:26:31'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0058', '', NULL, NULL, NULL, '2026-02-17 19:26:12', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 23:26:12', '2026-02-17 23:26:31'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0059', '', NULL, NULL, NULL, '2026-02-17 19:26:30', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0008, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 23:26:31', '2026-02-17 23:26:31'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0060', '', NULL, NULL, NULL, '2026-02-17 19:27:56', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 23:27:56', '2026-02-17 23:27:56'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0061', '', NULL, NULL, NULL, '2026-02-17 19:28:01', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 23:28:01', '2026-02-17 23:28:01'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0062', '', NULL, NULL, NULL, '2026-02-17 19:31:28', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-17 23:31:28', '2026-02-17 23:31:28'),
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 1, NULL, '0063', '', NULL, NULL, NULL, '2026-02-18 13:07:16', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-18 17:07:16', '2026-02-18 17:07:16');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `journal_entry_id`, `is_kitchen_order`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `delivery_date`, `shipping_status`, `delivered_to`, `delivery_person`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `payment_surcharge`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `woocommerce_order_id`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `crm_is_order_request`, `purchase_requisition_ids`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `pjt_project_id`, `pjt_title`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(0, 1, 2, NULL, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, NULL, NULL, 8, NULL, '0064', '', NULL, NULL, NULL, '2026-02-18 13:09:49', 0.2300, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.2300, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, 0.00, NULL, 0.0000, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2026-02-18 17:09:49', '2026-02-18 17:09:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaction_exchange_rates`
--

CREATE TABLE `transaction_exchange_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `exchange_rate` decimal(5,3) NOT NULL COMMENT '1 Purchase/Sell currency = ? Base Currency',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(11) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `transaction_no` varchar(191) DEFAULT NULL,
  `card_transaction_number` varchar(191) DEFAULT NULL,
  `card_number` varchar(191) DEFAULT NULL,
  `card_type` varchar(191) DEFAULT NULL,
  `card_holder_name` varchar(191) DEFAULT NULL,
  `card_month` varchar(191) DEFAULT NULL,
  `card_year` varchar(191) DEFAULT NULL,
  `card_security` varchar(5) DEFAULT NULL,
  `cheque_number` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT 0,
  `gateway` varchar(191) DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` int(11) DEFAULT NULL COMMENT 'stores the contact id',
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `payment_ref_no` varchar(191) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `payment_type`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `paid_through_link`, `gateway`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(112, 0, 1, 0, 0.2300, 'card', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-18 13:09:49', 1, 0, NULL, 0, 8, NULL, NULL, NULL, 'SP2026/0064', NULL, '2026-02-18 17:09:49', '2026-02-18 17:09:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(11) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text DEFAULT NULL,
  `woocommerce_line_items_id` int(11) DEFAULT NULL,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `woocommerce_line_items_id`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(57, 0, 0, 0, 1.0000, 0.0000, 0.0000, 0.2300, 0.2300, 'fixed', 0.0000, 0.2300, 0.0000, NULL, NULL, NULL, '', NULL, NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2026-02-18 17:09:49', '2026-02-18 17:09:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(11) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 6, 1.0000, 0.0000, '2026-02-17 19:51:49', '2026-02-17 19:51:49'),
(2, 2, NULL, 5, 1.0000, 0.0000, '2026-02-17 19:51:59', '2026-02-17 19:51:59'),
(3, 3, NULL, 5, 1.0000, 0.0000, '2026-02-17 19:52:49', '2026-02-17 19:52:49'),
(4, 4, NULL, 6, 1.0000, 0.0000, '2026-02-17 20:41:04', '2026-02-17 20:41:04'),
(5, 5, NULL, 6, 1.0000, 0.0000, '2026-02-17 20:41:14', '2026-02-17 20:41:14'),
(6, 6, NULL, 6, 1.0000, 0.0000, '2026-02-17 20:42:05', '2026-02-17 20:42:05'),
(7, 7, NULL, 6, 1.0000, 0.0000, '2026-02-17 20:42:10', '2026-02-17 20:42:10'),
(8, 8, NULL, 6, 1.0000, 0.0000, '2026-02-17 20:46:14', '2026-02-17 20:46:14'),
(9, 11, NULL, 6, 1.0000, 0.0000, '2026-02-17 20:48:03', '2026-02-17 20:48:03'),
(10, 12, NULL, 6, 1.0000, 0.0000, '2026-02-17 20:54:00', '2026-02-17 20:54:00'),
(11, 13, NULL, 6, 1.0000, 0.0000, '2026-02-17 20:54:19', '2026-02-17 20:54:19'),
(12, 14, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:01:27', '2026-02-17 21:01:27'),
(13, 15, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:01:50', '2026-02-17 21:01:50'),
(14, 16, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:05:39', '2026-02-17 21:05:39'),
(15, 17, NULL, 0, 1.0000, 0.0000, '2026-02-17 21:23:08', '2026-02-17 21:23:08'),
(16, 25, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:34:57', '2026-02-17 21:34:57'),
(17, 26, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:35:03', '2026-02-17 21:35:03'),
(18, 27, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:35:09', '2026-02-17 21:35:09'),
(19, 28, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:39:54', '2026-02-17 21:39:54'),
(20, 29, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:39:58', '2026-02-17 21:39:58'),
(21, 30, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:40:02', '2026-02-17 21:40:02'),
(22, 31, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:40:07', '2026-02-17 21:40:07'),
(23, 32, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:57:41', '2026-02-17 21:57:41'),
(24, 33, NULL, 6, 1.0000, 0.0000, '2026-02-17 21:59:50', '2026-02-17 21:59:50'),
(25, 35, NULL, 6, 1.0000, 0.0000, '2026-02-17 22:08:19', '2026-02-17 22:08:19'),
(26, 37, NULL, 6, 1.0000, 0.0000, '2026-02-17 22:12:54', '2026-02-17 22:12:54'),
(27, 38, NULL, 6, 1.0000, 0.0000, '2026-02-17 22:24:24', '2026-02-17 22:24:24'),
(28, 45, NULL, 0, 1.0000, 0.0000, '2026-02-17 23:25:48', '2026-02-17 23:25:48'),
(29, 46, NULL, 0, 1.0000, 0.0000, '2026-02-17 23:26:05', '2026-02-17 23:26:05'),
(30, 47, NULL, 0, 1.0000, 0.0000, '2026-02-17 23:26:12', '2026-02-17 23:26:12'),
(31, 48, NULL, 0, 1.0000, 0.0000, '2026-02-17 23:26:31', '2026-02-17 23:26:31'),
(32, 49, NULL, 0, 1.0000, 0.0000, '2026-02-17 23:27:57', '2026-02-17 23:27:57'),
(33, 50, NULL, 0, 1.0000, 0.0000, '2026-02-17 23:28:01', '2026-02-17 23:28:01'),
(34, 51, NULL, 0, 1.0000, 0.0000, '2026-02-17 23:31:28', '2026-02-17 23:31:28'),
(35, 56, NULL, 0, 1.0000, 0.0000, '2026-02-18 17:07:16', '2026-02-18 17:07:16'),
(36, 57, NULL, 0, 1.0000, 0.0000, '2026-02-18 17:09:50', '2026-02-18 17:09:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `journal_transaction_number` varchar(191) NOT NULL,
  `transfer_from_id` bigint(20) UNSIGNED NOT NULL,
  `transfer_to_id` bigint(20) UNSIGNED NOT NULL,
  `transfer_by_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) NOT NULL,
  `short_name` varchar(191) NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'UNIDAD', 'u.', 0, NULL, NULL, 1, NULL, '2025-08-27 00:19:38', '2025-09-25 16:29:13'),
(2, 2, 'kg', 'kg', 1, NULL, NULL, 4, NULL, '2026-01-30 13:42:59', '2026-02-02 09:35:42'),
(3, 2, 'unidade', 'u.', 0, NULL, NULL, 8, NULL, '2026-02-02 09:36:09', '2026-02-02 09:36:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'user',
  `surname` char(10) DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `language` char(7) NOT NULL DEFAULT 'en',
  `contact_no` char(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `essentials_department_id` int(11) DEFAULT NULL,
  `essentials_designation_id` int(11) DEFAULT NULL,
  `essentials_salary` decimal(22,4) DEFAULT NULL,
  `essentials_pay_period` varchar(191) DEFAULT NULL,
  `essentials_pay_cycle` varchar(191) DEFAULT NULL,
  `available_at` datetime DEFAULT NULL COMMENT 'Service staff avilable at. Calculated from product preparation_time_in_minutes',
  `paused_at` datetime DEFAULT NULL COMMENT 'Service staff available time paused at, Will be nulled on resume.',
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','terminated') NOT NULL DEFAULT 'active',
  `is_enable_service_staff_pin` tinyint(1) NOT NULL DEFAULT 0,
  `service_staff_pin` text DEFAULT NULL,
  `crm_contact_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') DEFAULT NULL,
  `blood_group` char(10) DEFAULT NULL,
  `contact_number` char(20) DEFAULT NULL,
  `alt_number` varchar(191) DEFAULT NULL,
  `family_number` varchar(191) DEFAULT NULL,
  `fb_link` varchar(191) DEFAULT NULL,
  `twitter_link` varchar(191) DEFAULT NULL,
  `social_media_1` varchar(191) DEFAULT NULL,
  `social_media_2` varchar(191) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `guardian_name` varchar(191) DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `bank_details` longtext DEFAULT NULL,
  `id_proof_name` varchar(191) DEFAULT NULL,
  `id_proof_number` varchar(191) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'user primary work location',
  `crm_department` varchar(191) DEFAULT NULL COMMENT 'Contact person''s department',
  `crm_designation` varchar(191) DEFAULT NULL COMMENT 'Contact person''s designation',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `essentials_department_id`, `essentials_designation_id`, `essentials_salary`, `essentials_pay_period`, `essentials_pay_cycle`, `available_at`, `paused_at`, `max_sales_discount_percent`, `allow_login`, `status`, `is_enable_service_staff_pin`, `service_staff_pin`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `location_id`, `crm_department`, `crm_designation`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', NULL, 'Multisoft', NULL, 'Admin', 'mlimpiaspaz@gmail.com', '$2y$10$Ttb1SDVuFfkw/UYVSElEOuOMslG87ongklG6IiHc0w1EPg8QlTOti', 'es', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-27 00:19:38', '2026-02-16 23:52:53'),
(2, 'user', NULL, 'Cajero', '1', 'Cajero1', 'cajero1@gmail.com', '$2y$10$2.kqcg5lzQSC6J4aUCAtge1I2V5L6hPbfgR0XWKzDDDSJ/vobr1pO', 'es', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'month', NULL, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-27 14:52:53', '2025-08-27 14:54:35'),
(3, 'user', NULL, 'Ramiro', NULL, 'Ramiro', 'ramiro@gmail.com', '$2y$10$b/HCqjJTPFXXgZoE7ohEfOBPEdYcX.rcwt5hHvXNmjq8V5nzL6p7q', 'es', NULL, NULL, 'JTrLLJT4Tvw51o3R4BRhf3rh4uZgdxTY3yUzKWtnbuMnZr446fo3dzUZztnQ', 1, NULL, NULL, NULL, 'month', NULL, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-25 16:54:56', '2025-09-25 16:58:38'),
(4, 'user', 'SEÑOR', 'NICOLAS', 'GABRIEL', 'Multisoft2026', 'nicolasgabriel26.a@gmail.com', '$2y$10$1E2h1PfNerY/PC3WgwVOBO58d1dc85KhY7rrvADCIa6.3eiaNZqOe', 'es', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', 1, '6862', NULL, 0, 0.00, 0, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', 'nicolas', NULL, NULL, NULL, NULL, '2026-02-01 09:32:49', '2026-01-30 13:42:59', '2026-02-01 09:32:49'),
(5, 'user', NULL, 'Jhon', NULL, 'Novamax', 'jhonaranibar33@gmail.com', '$2y$10$rMTd4Jy2caI5bMMIir8RruB5iwOmScgepHwMwU0cu9RL0DlsPwNXy', 'pt', NULL, NULL, NULL, 2, NULL, NULL, NULL, 'month', NULL, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-30 13:47:04', '2026-01-30 13:47:38'),
(6, 'user', 'SR.', 'JANAINA', 'GIMENEZ', 'janaina', 'janainagimenez45@gmail.com', '$2y$10$lvxFW2byAGWLNMGSuPQ8.u6uTyjI0iNwToidqXM1q91ZVSwaZCOaO', 'en', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01 09:23:04', '2026-02-01 09:29:07'),
(7, 'user', 'SR.', 'NICOLAS', 'GABRIEL', 'nicolas', 'nicolasgabriel26.a@gmail.com', '$2y$10$adou3tCOo5T/Ux7PKZmukusHGdXL9vkBASpeAH0QyIPP6p50RqQ1O', 'es', NULL, NULL, '1nktKcdfiaN8hRTrlrxb0irZtpukntVqtP5cGh8ll793cz5b63PHidu8Im4e', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-01 09:32:30', '2026-02-04 12:40:45'),
(8, 'user', NULL, 'programador', NULL, '0001', 'corumbamarket@gmail.com', '$2y$10$BRY6X2T9fLiNOEgc6qFIFupN8JPt0BwVSUFl/CO01TaTHpB8jdSzy', 'en', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-02 09:17:26', '2026-02-02 09:18:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_contact_access`
--

INSERT INTO `user_contact_access` (`id`, `user_id`, `contact_id`) VALUES
(0, 2, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `woocommerce_variation_id` int(11) DEFAULT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text DEFAULT NULL COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `woocommerce_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '0001', 1, NULL, NULL, 10.0000, 10.0000, 100.0000, 20.0000, 20.0000, '2025-08-26 16:03:21', '2025-08-26 19:59:40', NULL, '[]'),
(2, 'DUMMY', 2, '0002', 2, NULL, NULL, 500.0000, 500.0000, 500.0000, 3000.0000, 3000.0000, '2025-08-26 16:48:38', '2025-08-27 14:08:19', NULL, '[]'),
(3, 'DUMMY', 3, '0003', 3, NULL, NULL, 2600.0000, 2600.0000, 34.6200, 3500.0000, 3500.0000, '2025-08-27 14:01:08', '2025-08-27 15:12:58', NULL, '[]'),
(4, 'DUMMY', 4, '0004', 4, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(5, 'DUMMY', 5, '0005', 5, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(6, 'DUMMY', 6, '0006', 6, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(7, 'DUMMY', 7, '0007', 7, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(8, 'DUMMY', 8, '0008', 8, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(9, 'DUMMY', 9, '0009', 9, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(10, 'DUMMY', 10, '0010', 10, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(11, 'DUMMY', 11, '0011', 11, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(12, 'DUMMY', 12, '0012', 12, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(13, 'DUMMY', 13, '0013', 13, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(14, 'DUMMY', 14, '0014', 14, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(15, 'DUMMY', 15, '0015', 15, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(16, 'DUMMY', 16, '0016', 16, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(17, 'DUMMY', 17, '0017', 17, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(18, 'DUMMY', 18, '0018', 18, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(19, 'DUMMY', 19, '0019', 19, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(20, 'DUMMY', 20, '0020', 20, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(21, 'DUMMY', 21, '0021', 21, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(22, 'DUMMY', 22, '0022', 22, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(23, 'DUMMY', 23, '0023', 23, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(24, 'DUMMY', 24, '0024', 24, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(25, 'DUMMY', 25, '0025', 25, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(26, 'DUMMY', 26, '0026', 26, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(27, 'DUMMY', 27, '0027', 27, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(28, 'DUMMY', 28, '0028', 28, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(29, 'DUMMY', 29, '0029', 29, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(30, 'DUMMY', 30, '0030', 30, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(31, 'DUMMY', 31, '0031', 31, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(32, 'DUMMY', 32, '0032', 32, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(33, 'DUMMY', 33, '0033', 33, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(34, 'DUMMY', 34, '0034', 34, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(35, 'DUMMY', 35, '0035', 35, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(36, 'DUMMY', 36, '0036', 36, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(37, 'DUMMY', 37, '0037', 37, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(38, 'DUMMY', 38, '0038', 38, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(39, 'DUMMY', 39, '0039', 39, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(40, 'DUMMY', 40, '0040', 40, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(41, 'DUMMY', 41, '0041', 41, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(42, 'DUMMY', 42, '0042', 42, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(43, 'DUMMY', 43, '0043', 43, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(44, 'DUMMY', 44, '0044', 44, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(45, 'DUMMY', 45, '0045', 45, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(46, 'DUMMY', 46, '0046', 46, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(47, 'DUMMY', 47, '0047', 47, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(48, 'DUMMY', 48, '0048', 48, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(49, 'DUMMY', 49, '0049', 49, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(50, 'DUMMY', 50, '0050', 50, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(51, 'DUMMY', 51, '0051', 51, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(52, 'DUMMY', 52, '0052', 52, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(53, 'DUMMY', 53, '0053', 53, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(54, 'DUMMY', 54, '0054', 54, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(55, 'DUMMY', 55, '0055', 55, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(56, 'DUMMY', 56, '0056', 56, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(57, 'DUMMY', 57, '0057', 57, NULL, NULL, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, '2025-09-25 16:52:37', '2025-09-25 16:52:37', NULL, '[]'),
(58, 'DUMMY', 58, '7891527000474', 58, NULL, NULL, 8.9800, 8.9800, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:16', '2026-02-05 14:34:10', NULL, '[]'),
(59, 'DUMMY', 59, '7898946613575', 59, NULL, NULL, 7.9900, 7.9900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:16', '2026-02-05 14:27:58', NULL, '[]'),
(60, 'DUMMY', 60, '7898934113940', 60, NULL, NULL, 9.9000, 9.9000, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:16', '2026-02-05 14:30:24', NULL, '[]'),
(61, 'DUMMY', 61, '7894904795253', 61, NULL, NULL, 8.4900, 8.4900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:16', '2026-02-05 14:32:32', NULL, '[]'),
(62, 'DUMMY', 62, '0062', 62, NULL, NULL, 9.9900, 9.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(63, 'DUMMY', 63, '7892696839926', 63, NULL, NULL, 15.9800, 15.9800, 0.0000, 20.0000, 20.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(64, 'DUMMY', 64, '0064', 64, NULL, NULL, 6.6000, 6.6000, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:16', '2026-02-03 07:51:38', NULL, '[]'),
(65, 'DUMMY', 65, '7893069322540', 65, NULL, NULL, 21.2700, 21.2700, 0.0000, 38.0000, 38.0000, '2026-02-02 09:40:16', '2026-02-02 17:06:35', NULL, '[]'),
(66, 'DUMMY', 66, '7894264429638', 66, NULL, NULL, 3.6300, 3.6300, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:16', '2026-02-02 17:50:07', NULL, '[]'),
(67, 'DUMMY', 67, '7890497929020', 67, NULL, NULL, 2.4900, 2.4900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:16', '2026-02-02 17:51:24', NULL, '[]'),
(68, 'DUMMY', 68, '7893302251286', 68, NULL, NULL, 3.6300, 3.6300, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:16', '2026-02-02 17:55:53', NULL, '[]'),
(69, 'DUMMY', 69, '7892331265592', 69, NULL, NULL, 3.4700, 3.4700, 0.0000, 7.5000, 7.5000, '2026-02-02 09:40:16', '2026-02-02 18:53:33', NULL, '[]'),
(70, 'DUMMY', 70, '7895567439607', 70, NULL, NULL, 1.4800, 1.4800, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:16', '2026-02-02 18:54:38', NULL, '[]'),
(71, 'DUMMY', 71, '7894314469454', 71, NULL, NULL, 1.6500, 1.6500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:16', '2026-02-11 14:32:18', NULL, '[]'),
(72, 'DUMMY', 72, '7896891046462', 72, NULL, NULL, 2.9700, 2.9700, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(73, 'DUMMY', 73, '7896260433626', 73, NULL, NULL, 2.9700, 2.9700, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:16', '2026-02-03 10:45:15', NULL, '[]'),
(74, 'DUMMY', 74, '7896002100014', 74, NULL, NULL, 15.9000, 15.9000, 0.0000, 21.0000, 21.0000, '2026-02-02 09:40:16', '2026-02-02 15:42:22', NULL, '[]'),
(75, 'DUMMY', 75, '0075', 75, NULL, NULL, 34.0000, 34.0000, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:16', '2026-02-02 15:44:59', NULL, '[]'),
(76, 'DUMMY', 76, '6942001312109', 76, NULL, NULL, 0.7000, 0.7000, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:16', '2026-02-02 15:51:53', NULL, '[]'),
(77, 'DUMMY', 77, '7896902208469', 77, NULL, NULL, 4.8500, 4.8500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:16', '2026-02-02 15:54:27', NULL, '[]'),
(78, 'DUMMY', 78, '7897520800059', 78, NULL, NULL, 0.0000, 0.0000, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:16', '2026-02-02 16:03:39', NULL, '[]'),
(79, 'DUMMY', 79, '7897417400997', 79, NULL, NULL, 1.3800, 1.3800, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:16', '2026-02-02 16:11:01', NULL, '[]'),
(80, 'DUMMY', 80, '7897534833302', 80, NULL, NULL, 3.3800, 3.3800, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:16', '2026-02-02 16:12:40', NULL, '[]'),
(81, 'DUMMY', 81, '7897534833296', 81, NULL, NULL, 3.3800, 3.3800, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:16', '2026-02-02 16:16:17', NULL, '[]'),
(82, 'DUMMY', 82, '7898902479115', 82, NULL, NULL, 3.2500, 3.2500, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:16', '2026-02-02 16:18:53', NULL, '[]'),
(83, 'DUMMY', 83, '7898902479108', 83, NULL, NULL, 3.0000, 3.0000, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:16', '2026-02-02 16:21:39', NULL, '[]'),
(84, 'DUMMY', 84, '7897664171701', 84, NULL, NULL, 1.7900, 1.7900, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:16', '2026-02-02 16:52:09', NULL, '[]'),
(85, 'DUMMY', 85, '7908324400120', 85, NULL, NULL, 1.7900, 1.7900, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:16', '2026-02-02 16:53:17', NULL, '[]'),
(86, 'DUMMY', 86, '789766417175', 86, NULL, NULL, 1.9500, 1.9500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:16', '2026-02-02 16:43:45', NULL, '[]'),
(87, 'DUMMY', 87, '7898142863774', 87, NULL, NULL, 13.9000, 13.9000, 0.0000, 19.0000, 19.0000, '2026-02-02 09:40:16', '2026-02-02 17:22:40', NULL, '[]'),
(88, 'DUMMY', 88, '7891700206921', 88, NULL, NULL, 9.4500, 9.4500, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:16', '2026-02-02 17:23:24', NULL, '[]'),
(89, 'DUMMY', 89, '7898922618099', 89, NULL, NULL, 19.0500, 19.0500, 0.0000, 24.0000, 24.0000, '2026-02-02 09:40:16', '2026-02-02 17:34:54', NULL, '[]'),
(90, 'DUMMY', 90, '7896433800392', 90, NULL, NULL, 5.8900, 5.8900, 0.0000, 10.9900, 10.9900, '2026-02-02 09:40:16', '2026-02-02 17:41:01', NULL, '[]'),
(91, 'DUMMY', 91, '7896221400353', 91, NULL, NULL, 2.5500, 2.5500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-02 17:45:36', NULL, '[]'),
(92, 'DUMMY', 92, '7896092501302', 92, NULL, NULL, 20.4500, 20.4500, 0.0000, 24.0000, 24.0000, '2026-02-02 09:40:16', '2026-02-02 17:46:49', NULL, '[]'),
(93, 'DUMMY', 93, '7891022868036', 93, NULL, NULL, 2.7500, 2.7500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:16', '2026-02-02 18:15:02', NULL, '[]'),
(94, 'DUMMY', 94, '7891350032741', 94, NULL, NULL, 10.4600, 10.4600, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-02 18:19:25', NULL, '[]'),
(95, 'DUMMY', 95, '7891350032406', 95, NULL, NULL, 10.4600, 10.4600, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-02 18:20:44', NULL, '[]'),
(96, 'DUMMY', 96, '7891350037807', 96, NULL, NULL, 10.4500, 10.4500, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-02 18:21:30', NULL, '[]'),
(97, 'DUMMY', 97, '7891350032857', 97, NULL, NULL, 7.9900, 7.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:16', '2026-02-02 18:22:20', NULL, '[]'),
(98, 'DUMMY', 98, '0098', 98, NULL, NULL, 27.9000, 27.9000, 0.0000, 33.0000, 33.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(99, 'DUMMY', 99, '7898657830926', 99, NULL, NULL, 5.4900, 5.4900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:16', '2026-02-02 18:47:41', NULL, '[]'),
(100, 'DUMMY', 100, '7896440504047', 100, NULL, NULL, 7.8900, 7.8900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:16', '2026-02-02 18:50:27', NULL, '[]'),
(101, 'DUMMY', 101, '7896045115365', 101, NULL, NULL, 6.0000, 6.0000, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:16', '2026-02-02 19:05:11', NULL, '[]'),
(102, 'DUMMY', 102, '7891515901059', 102, NULL, NULL, 3.9800, 3.9800, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:16', '2026-02-02 19:11:09', NULL, '[]'),
(103, 'DUMMY', 103, '7891515901066', 103, NULL, NULL, 3.4500, 3.4500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:16', '2026-02-02 19:11:53', NULL, '[]'),
(105, 'DUMMY', 105, '7896000705969', 105, NULL, NULL, 11.9500, 11.9500, 0.0000, 14.9900, 14.9900, '2026-02-02 09:40:16', '2026-02-04 12:42:05', NULL, '[]'),
(106, 'DUMMY', 106, '7896000705952', 106, NULL, NULL, 11.5900, 11.5900, 0.0000, 14.9900, 14.9900, '2026-02-02 09:40:16', '2026-02-04 12:44:53', NULL, '[]'),
(107, 'DUMMY', 107, '7896000706010', 107, NULL, NULL, 11.5900, 11.5900, 0.0000, 14.9900, 14.9900, '2026-02-02 09:40:16', '2026-02-04 08:41:06', NULL, '[]'),
(108, 'DUMMY', 108, '7891527069969', 108, NULL, NULL, 19.0000, 19.0000, 0.0000, 22.0000, 22.0000, '2026-02-02 09:40:16', '2026-02-04 12:47:35', NULL, '[]'),
(109, 'DUMMY', 109, '6972841050282', 109, NULL, NULL, 2.1200, 2.1200, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:16', '2026-02-05 08:46:07', NULL, '[]'),
(110, 'DUMMY', 110, '7908545601351', 110, NULL, NULL, 21.6900, 21.6900, 0.0000, 25.0000, 25.0000, '2026-02-02 09:40:16', '2026-02-05 14:39:43', NULL, '[]'),
(111, 'DUMMY', 111, '4908135601399', 111, NULL, NULL, 21.6900, 21.6900, 0.0000, 25.0000, 25.0000, '2026-02-02 09:40:16', '2026-02-05 14:48:46', NULL, '[]'),
(112, 'DUMMY', 112, '7894900603705', 112, NULL, NULL, 2.4900, 2.4900, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:16', '2026-02-05 14:57:24', NULL, '[]'),
(113, 'DUMMY', 113, '7894904271535', 113, NULL, NULL, 5.1500, 5.1500, 0.0000, 7.5000, 7.5000, '2026-02-02 09:40:16', '2026-02-05 14:58:15', NULL, '[]'),
(114, 'DUMMY', 114, '7898575690794', 114, NULL, NULL, 9.9000, 9.9000, 0.0000, 15.0000, 15.0000, '2026-02-02 09:40:16', '2026-02-05 14:59:57', NULL, '[]'),
(115, 'DUMMY', 115, '7898575690800', 115, NULL, NULL, 9.9000, 9.9000, 0.0000, 15.0000, 15.0000, '2026-02-02 09:40:16', '2026-02-05 14:59:00', NULL, '[]'),
(116, 'DUMMY', 116, '7898586615328', 116, NULL, NULL, 6.9900, 6.9900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:16', '2026-02-05 15:03:43', NULL, '[]'),
(117, 'DUMMY', 117, '7898586615366', 117, NULL, NULL, 6.9900, 6.9900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:16', '2026-02-05 15:04:37', NULL, '[]'),
(118, 'DUMMY', 118, '7898133131011', 118, NULL, NULL, 4.5000, 4.5000, 0.0000, 7.5000, 7.5000, '2026-02-02 09:40:16', '2026-02-05 15:05:19', NULL, '[]'),
(119, 'DUMMY', 119, '7500435250603', 119, NULL, NULL, 21.9000, 21.9000, 0.0000, 28.0000, 28.0000, '2026-02-02 09:40:16', '2026-02-05 15:28:20', NULL, '[]'),
(120, 'DUMMY', 120, '7506339389876', 120, NULL, NULL, 21.9000, 21.9000, 0.0000, 28.0000, 28.0000, '2026-02-02 09:40:16', '2026-02-05 15:50:10', NULL, '[]'),
(121, 'DUMMY', 121, '0121', 121, NULL, NULL, 24.9000, 24.9000, 0.0000, 30.0000, 30.0000, '2026-02-02 09:40:16', '2026-02-05 15:58:43', NULL, '[]'),
(122, 'DUMMY', 122, '0122', 122, NULL, NULL, 24.9000, 24.9000, 0.0000, 30.0000, 30.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(123, 'DUMMY', 123, '7899706164375', 123, NULL, NULL, 24.9000, 24.9000, 0.0000, 30.0000, 30.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(124, 'DUMMY', 124, '0124', 124, NULL, NULL, 24.9000, 24.9000, 0.0000, 30.0000, 30.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(125, 'DUMMY', 125, '7899706188302', 125, NULL, NULL, 24.9000, 24.9000, 0.0000, 30.0000, 30.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(126, 'DUMMY', 126, '7890519251511', 126, NULL, NULL, 1.6900, 1.6900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:16', '2026-02-05 16:08:09', NULL, '[]'),
(127, 'DUMMY', 127, '2860900030396', 127, NULL, NULL, 2.8500, 2.8500, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:16', '2026-02-03 16:57:32', NULL, '[]'),
(128, 'DUMMY', 128, '7894900050394', 128, NULL, NULL, 2.8500, 2.8500, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:16', '2026-02-05 16:18:35', NULL, '[]'),
(129, 'DUMMY', 129, '7896279601375', 129, NULL, NULL, 2.8800, 2.8800, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:16', '2026-02-05 16:22:59', NULL, '[]'),
(130, 'DUMMY', 130, '7898641047040', 130, NULL, NULL, 15.8900, 15.8900, 0.0000, 20.0000, 20.0000, '2026-02-02 09:40:16', '2026-02-05 16:25:39', NULL, '[]'),
(131, 'DUMMY', 131, '7908545601382', 131, NULL, NULL, 21.6900, 21.6900, 0.0000, 25.0000, 25.0000, '2026-02-02 09:40:16', '2026-02-05 16:27:21', NULL, '[]'),
(132, 'DUMMY', 132, '7896098902226', 132, NULL, NULL, 1.7900, 1.7900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:16', '2026-02-05 16:34:33', NULL, '[]'),
(133, 'DUMMY', 133, '789698902264', 133, NULL, NULL, 1.7900, 1.7900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:16', '2026-02-05 17:20:08', NULL, '[]'),
(134, 'DUMMY', 134, '7896098902219', 134, NULL, NULL, 1.7900, 1.7900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:16', '2026-02-05 17:22:29', NULL, '[]'),
(135, 'DUMMY', 135, '7896098902233', 135, NULL, NULL, 1.7900, 1.7900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:16', '2026-02-05 17:21:57', NULL, '[]'),
(136, 'DUMMY', 136, '7896098902264', 136, NULL, NULL, 1.7900, 1.7900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:16', '2026-02-05 16:36:18', NULL, '[]'),
(137, 'DUMMY', 137, '898044047057', 137, NULL, NULL, 11.7500, 11.7500, 0.0000, 16.0000, 16.0000, '2026-02-02 09:40:16', '2026-02-05 17:26:13', NULL, '[]'),
(138, 'DUMMY', 138, '7891151039512', 138, NULL, NULL, 1.2900, 1.2900, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:16', '2026-02-05 17:30:22', NULL, '[]'),
(139, 'DUMMY', 139, '7896221400599', 139, NULL, NULL, 3.1300, 3.1300, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:16', '2026-02-05 17:31:15', NULL, '[]'),
(140, 'DUMMY', 140, '7896862002923', 140, NULL, NULL, 5.3500, 5.3500, 0.0000, 6.5000, 6.5000, '2026-02-02 09:40:16', '2026-02-06 11:28:57', NULL, '[]'),
(141, 'DUMMY', 141, '7897517206284', 141, NULL, NULL, 2.2500, 2.2500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-06 11:29:47', NULL, '[]'),
(142, 'DUMMY', 142, '7896718700317', 142, NULL, NULL, 2.8000, 2.8000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-06 11:31:21', NULL, '[]'),
(143, 'DUMMY', 143, '7896718700928', 143, NULL, NULL, 2.1500, 2.1500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-06 11:32:12', NULL, '[]'),
(144, 'DUMMY', 144, '7898942054655', 144, NULL, NULL, 10.9000, 10.9000, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(145, 'DUMMY', 145, '7898942055720', 145, NULL, NULL, 10.9000, 10.9000, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-07 09:22:56', NULL, '[]'),
(146, 'DUMMY', 146, '7898942054655', 146, NULL, NULL, 10.5000, 10.5000, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(147, 'DUMMY', 147, '7898942055218', 147, NULL, NULL, 10.9000, 10.9000, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-06 11:33:12', NULL, '[]'),
(148, 'DUMMY', 148, '7898942055249', 148, NULL, NULL, 2.6900, 2.6900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-03 11:05:51', NULL, '[]'),
(149, 'DUMMY', 149, '7898942053320', 149, NULL, NULL, 2.5900, 2.5900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-07 09:26:21', NULL, '[]'),
(150, 'DUMMY', 150, '7897332000067', 150, NULL, NULL, 5.0000, 5.0000, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:16', '2026-02-03 10:55:37', NULL, '[]'),
(151, 'DUMMY', 151, '7772106007063', 151, NULL, NULL, 7.2400, 7.2400, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-07 09:39:15', NULL, '[]'),
(152, 'DUMMY', 152, '7897417400508', 152, NULL, NULL, 2.5000, 2.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-07 09:49:19', NULL, '[]'),
(153, 'DUMMY', 153, '7891991011235', 153, NULL, NULL, 1.9100, 1.9100, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-03 10:53:54', NULL, '[]'),
(154, 'DUMMY', 154, '7893595269500', 154, NULL, NULL, 1.2900, 1.2900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-07 10:02:26', NULL, '[]'),
(155, 'DUMMY', 155, '7891515554224', 155, NULL, NULL, 1.4500, 1.4500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:16', '2026-02-07 10:12:37', NULL, '[]'),
(156, 'DUMMY', 156, '7893694001827', 156, NULL, NULL, 8.9000, 8.9000, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-11 09:36:12', NULL, '[]'),
(157, 'DUMMY', 157, '7893694026660', 157, NULL, NULL, 5.9000, 5.9000, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-11 09:37:01', NULL, '[]'),
(158, 'DUMMY', 158, '0158', 158, NULL, NULL, 7.9900, 7.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:16', '2026-02-11 09:38:14', NULL, '[]'),
(159, 'DUMMY', 159, '7893694058661', 159, NULL, NULL, 7.9900, 7.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:16', '2026-02-02 09:40:16', NULL, '[]'),
(160, 'DUMMY', 160, '7893694010669', 160, NULL, NULL, 8.9000, 8.9000, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-11 09:40:47', NULL, '[]'),
(161, 'DUMMY', 161, '7893694020668', 161, NULL, NULL, 8.9000, 8.9000, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-11 09:40:03', NULL, '[]'),
(162, 'DUMMY', 162, '7893694006662', 162, NULL, NULL, 8.9000, 8.9000, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:16', '2026-02-11 09:39:09', NULL, '[]'),
(163, 'DUMMY', 163, '7894900650013', 163, NULL, NULL, 2.4900, 2.4900, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:16', '2026-02-11 09:41:32', NULL, '[]'),
(164, 'DUMMY', 164, '7894900563702', 164, NULL, NULL, 2.2500, 2.2500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-11 09:42:10', NULL, '[]'),
(165, 'DUMMY', 165, '7899710006531', 165, NULL, NULL, 3.5700, 3.5700, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-11 09:56:53', NULL, '[]'),
(166, 'DUMMY', 166, '7896080870144', 166, NULL, NULL, 3.9800, 3.9800, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-11 12:45:32', NULL, '[]'),
(167, 'DUMMY', 167, '7896003738582', 167, NULL, NULL, 7.4900, 7.4900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-11 14:40:26', NULL, '[]'),
(168, 'DUMMY', 168, '7898694892031', 168, NULL, NULL, 13.8400, 13.8400, 0.0000, 19.5000, 19.5000, '2026-02-02 09:40:17', '2026-02-11 14:42:07', NULL, '[]'),
(169, 'DUMMY', 169, '7891021001946', 169, NULL, NULL, 5.7500, 5.7500, 0.0000, 7.5000, 7.5000, '2026-02-02 09:40:17', '2026-02-12 09:13:09', NULL, '[]'),
(170, 'DUMMY', 170, '7898406303084', 170, NULL, NULL, 2.3500, 2.3500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-12 09:14:08', NULL, '[]'),
(171, 'DUMMY', 171, '7896423701357', 171, NULL, NULL, 6.8900, 6.8900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-12 09:38:11', NULL, '[]'),
(172, 'DUMMY', 172, '7896423701388', 172, NULL, NULL, 6.8900, 6.8900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-12 09:39:00', NULL, '[]'),
(173, 'DUMMY', 173, '7896423701401', 173, NULL, NULL, 6.8900, 6.8900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-12 09:39:42', NULL, '[]'),
(174, 'DUMMY', 174, '7898919412341', 174, NULL, NULL, 10.9800, 10.9800, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-12 09:45:52', NULL, '[]'),
(175, 'DUMMY', 175, '7898919412334', 175, NULL, NULL, 10.9900, 10.9900, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-12 09:47:53', NULL, '[]'),
(176, 'DUMMY', 176, '7891350034615', 176, NULL, NULL, 7.9900, 7.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-12 09:49:10', NULL, '[]'),
(177, 'DUMMY', 177, '7898919412372', 177, NULL, NULL, 10.9800, 10.9800, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-12 09:52:12', NULL, '[]'),
(178, 'DUMMY', 178, '7898938890090', 178, NULL, NULL, 7.9800, 7.9800, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-12 09:55:09', NULL, '[]'),
(179, 'DUMMY', 179, '7891000319581', 179, NULL, NULL, 7.0500, 7.0500, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-12 10:00:14', NULL, '[]'),
(180, 'DUMMY', 180, '7891000319628', 180, NULL, NULL, 7.0500, 7.0500, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-12 10:14:20', NULL, '[]'),
(181, 'DUMMY', 181, '7896111421536', 181, NULL, NULL, 2.0000, 2.0000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-12 10:15:39', NULL, '[]'),
(182, 'DUMMY', 182, '892417421536', 182, NULL, NULL, 2.0000, 2.0000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-12 10:16:28', NULL, '[]'),
(183, 'DUMMY', 183, '7891079014295', 183, NULL, NULL, 1.9500, 1.9500, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-12 10:17:29', NULL, '[]'),
(184, 'DUMMY', 184, '7897534833111', 184, NULL, NULL, 3.9600, 3.9600, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-12 11:49:11', NULL, '[]'),
(185, 'DUMMY', 185, '7622210570116', 185, NULL, NULL, 2.3600, 2.3600, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-12 11:54:28', NULL, '[]'),
(186, 'DUMMY', 186, '7896002311410', 186, NULL, NULL, 7.9900, 7.9900, 0.0000, 10.4900, 10.4900, '2026-02-02 09:40:17', '2026-02-12 11:58:09', NULL, '[]'),
(187, 'DUMMY', 187, '7896423700251', 187, NULL, NULL, 3.3900, 3.3900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-03 09:04:27', NULL, '[]'),
(188, 'DUMMY', 188, '7896034610017', 188, NULL, NULL, 3.9900, 3.9900, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-03 17:01:05', NULL, '[]'),
(189, 'DUMMY', 189, '7896423704204', 189, NULL, NULL, 3.3900, 3.3900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-12 14:07:13', NULL, '[]'),
(190, 'DUMMY', 190, '7892840813130', 190, NULL, NULL, 2.4000, 2.4000, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-12 14:08:53', NULL, '[]'),
(191, 'DUMMY', 191, '7898943302946', 191, NULL, NULL, 1.4000, 1.4000, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-12 14:17:51', NULL, '[]'),
(192, 'DUMMY', 192, '78928008', 192, NULL, NULL, 0.1700, 0.1700, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(193, 'DUMMY', 193, '78927995', 193, NULL, NULL, 0.1800, 0.1800, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(194, 'DUMMY', 194, '78927988', 194, NULL, NULL, 0.1800, 0.1800, 0.0000, 0.2500, 0.2500, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(195, 'DUMMY', 195, '7896379910520', 195, NULL, NULL, 0.2700, 0.2700, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(196, 'DUMMY', 196, '7891527069365', 196, NULL, NULL, 21.0000, 21.0000, 0.0000, 24.0000, 24.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(197, 'DUMMY', 197, '7771609003275', 197, NULL, NULL, 4.6500, 4.6500, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(198, 'DUMMY', 198, '7897486800513', 198, NULL, NULL, 3.8900, 3.8900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(199, 'DUMMY', 199, '6952337300268', 199, NULL, NULL, 1.1300, 1.1300, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(200, 'DUMMY', 200, '7898942055935', 200, NULL, NULL, 1.2900, 1.2900, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(201, 'DUMMY', 201, '7898942055898', 201, NULL, NULL, 1.2900, 1.2900, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(202, 'DUMMY', 202, '7898942055942', 202, NULL, NULL, 1.2900, 1.2900, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(203, 'DUMMY', 203, '7896022203207', 203, NULL, NULL, 1.4500, 1.4500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(204, 'DUMMY', 204, '7896022203771', 204, NULL, NULL, 1.4500, 1.4500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(205, 'DUMMY', 205, '7898942055683', 205, NULL, NULL, 6.1500, 6.1500, 0.0000, 7.5000, 7.5000, '2026-02-02 09:40:17', '2026-02-03 07:46:26', NULL, '[]'),
(206, 'DUMMY', 206, '7896253401861', 206, NULL, NULL, 4.3500, 4.3500, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-12 14:25:13', NULL, '[]'),
(207, 'DUMMY', 207, '7893000488878', 207, NULL, NULL, 13.9900, 13.9900, 0.0000, 16.5000, 16.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(208, 'DUMMY', 208, '0208', 208, NULL, NULL, 9.9800, 9.9800, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(209, 'DUMMY', 209, '7897812100782', 209, NULL, NULL, 13.9500, 13.9500, 0.0000, 20.0000, 20.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(210, 'DUMMY', 210, '5765115853808', 210, NULL, NULL, 7.9900, 7.9900, 0.0000, 11.0000, 11.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(211, 'DUMMY', 211, '7896286622509', 211, NULL, NULL, 1.0500, 1.0500, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(212, 'DUMMY', 212, '7896286622530', 212, NULL, NULL, 1.0000, 1.0000, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(213, 'DUMMY', 213, '7896286622516', 213, NULL, NULL, 1.0000, 1.0000, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(214, 'DUMMY', 214, '7896286622523', 214, NULL, NULL, 1.0400, 1.0400, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(215, 'DUMMY', 215, '7896004400020', 215, NULL, NULL, 4.8500, 4.8500, 0.0000, 6.5000, 6.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(216, 'DUMMY', 216, '070330731806', 216, NULL, NULL, 6.1900, 6.1900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(217, 'DUMMY', 217, '7622210570086', 217, NULL, NULL, 2.3600, 2.3600, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-12 14:24:26', NULL, '[]'),
(218, 'DUMMY', 218, '0218', 218, NULL, NULL, 15.0000, 15.0000, 0.0000, 26.0000, 26.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(219, 'DUMMY', 219, '7891962053189', 219, NULL, NULL, 4.8500, 4.8500, 0.0000, 6.5000, 6.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(221, 'DUMMY', 221, '7896058258653', 221, NULL, NULL, 2.6900, 2.6900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(222, 'DUMMY', 222, '0222', 222, NULL, NULL, 17.9000, 17.9000, 0.0000, 23.0000, 23.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(223, 'DUMMY', 223, '0223', 223, NULL, NULL, 18.0000, 18.0000, 0.0000, 22.0000, 22.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(224, 'DUMMY', 224, '7895408064814', 224, NULL, NULL, 19.9800, 19.9800, 0.0000, 23.0000, 23.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(225, 'DUMMY', 225, '7891168100014', 225, NULL, NULL, 3.4500, 3.4500, 0.0000, 5.4900, 5.4900, '2026-02-02 09:40:17', '2026-02-03 07:54:11', NULL, '[]'),
(226, 'DUMMY', 226, '7896020470427', 226, NULL, NULL, 1.5200, 1.5200, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(227, 'DUMMY', 227, '7896527701642', 227, NULL, NULL, 9.9900, 9.9900, 0.0000, 15.0000, 15.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(228, 'DUMMY', 228, '7393014852387', 228, NULL, NULL, 5.3500, 5.3500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(230, 'DUMMY', 230, '0230', 230, NULL, NULL, 5.4300, 5.4300, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(231, 'DUMMY', 231, '7896098904121', 231, NULL, NULL, 4.8500, 4.8500, 0.0000, 7.9900, 7.9900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(232, 'DUMMY', 232, '7896098900253', 232, NULL, NULL, 2.7800, 2.7800, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(233, 'DUMMY', 233, '7896098902394', 233, NULL, NULL, 10.6500, 10.6500, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(234, 'DUMMY', 234, '7891095028344', 234, NULL, NULL, 3.9800, 3.9800, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(235, 'DUMMY', 235, '7842559000772', 235, NULL, NULL, 1.6000, 1.6000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(236, 'DUMMY', 236, '7894904009862', 236, NULL, NULL, 11.9900, 11.9900, 0.0000, 20.0000, 20.0000, '2026-02-02 09:40:17', '2026-02-02 18:33:51', NULL, '[]'),
(237, 'DUMMY', 237, '7891527000795', 237, NULL, NULL, 16.9000, 16.9000, 0.0000, 20.0000, 20.0000, '2026-02-02 09:40:17', '2026-02-02 21:19:09', NULL, '[]'),
(238, 'DUMMY', 238, '7893000005969', 238, NULL, NULL, 9.0000, 9.0000, 0.0000, 16.0000, 16.0000, '2026-02-02 09:40:17', '2026-02-05 14:31:35', NULL, '[]'),
(239, 'DUMMY', 239, '7898641047002', 239, NULL, NULL, 11.9800, 11.9800, 0.0000, 16.0000, 16.0000, '2026-02-02 09:40:17', '2026-02-05 14:36:53', NULL, '[]'),
(240, 'DUMMY', 240, '7891515194864', 240, NULL, NULL, 9.2900, 9.2900, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-12 09:41:28', NULL, '[]'),
(241, 'DUMMY', 241, '7891515531331', 241, NULL, NULL, 4.7500, 4.7500, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-12 14:10:55', NULL, '[]'),
(242, 'DUMMY', 242, '7897119300922', 242, NULL, NULL, 10.3500, 10.3500, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(243, 'DUMMY', 243, '0243', 243, NULL, NULL, 7.9900, 7.9900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(244, 'DUMMY', 244, '7896816882960', 244, NULL, NULL, 10.8500, 10.8500, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-03 08:20:17', NULL, '[]'),
(245, 'DUMMY', 245, '7891527064919', 245, NULL, NULL, 1.9600, 1.9600, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-12 14:28:49', NULL, '[]'),
(246, 'DUMMY', 246, '7894904727186', 246, NULL, NULL, 16.0000, 16.0000, 0.0000, 20.0000, 20.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(247, 'DUMMY', 247, '7891107101621', 247, NULL, NULL, 7.9900, 7.9900, 0.0000, 9.9900, 9.9900, '2026-02-02 09:40:17', '2026-02-02 15:47:00', NULL, '[]'),
(248, 'DUMMY', 248, '7896423705232', 248, NULL, NULL, 2.4900, 2.4900, 0.0000, 4.5000, 4.5000, '2026-02-02 09:40:17', '2026-02-02 16:08:46', NULL, '[]'),
(249, 'DUMMY', 249, '7897115102940', 249, NULL, NULL, 4.7000, 4.7000, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 17:09:47', NULL, '[]'),
(250, 'DUMMY', 250, '7893582587792', 250, NULL, NULL, 1.1700, 1.1700, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 17:10:05', NULL, '[]'),
(251, 'DUMMY', 251, '7897115100229', 251, NULL, NULL, 1.4400, 1.4400, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 17:10:31', NULL, '[]'),
(252, 'DUMMY', 252, '7897115108218', 252, NULL, NULL, 1.6900, 1.6900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 17:11:13', NULL, '[]'),
(253, 'DUMMY', 253, '7899567245220', 253, NULL, NULL, 5.7900, 5.7900, 0.0000, 9.4900, 9.4900, '2026-02-02 09:40:17', '2026-02-02 17:14:33', NULL, '[]'),
(254, 'DUMMY', 254, '7896047200014', 254, NULL, NULL, 3.8500, 3.8500, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 17:30:14', NULL, '[]'),
(255, 'DUMMY', 255, '7896221401206', 255, NULL, NULL, 2.8000, 2.8000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 17:44:55', NULL, '[]'),
(256, 'DUMMY', 256, '7891666553640', 256, NULL, NULL, 0.1300, 0.1300, 0.0000, 0.2500, 0.2500, '2026-02-02 09:40:17', '2026-02-02 17:47:22', NULL, '[]'),
(257, 'DUMMY', 257, '0257', 257, NULL, NULL, 0.1000, 0.1000, 0.0000, 0.2000, 0.2000, '2026-02-02 09:40:17', '2026-02-02 17:48:15', NULL, '[]'),
(258, 'DUMMY', 258, '0258', 258, NULL, NULL, 0.5700, 0.5700, 0.0000, 0.2000, 0.2000, '2026-02-02 09:40:17', '2026-02-02 17:48:50', NULL, '[]'),
(259, 'DUMMY', 259, '7896221400605', 259, NULL, NULL, 4.3800, 4.3800, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 17:52:02', NULL, '[]'),
(260, 'DUMMY', 260, '78912359', 260, NULL, NULL, 1.7900, 1.7900, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 17:52:58', NULL, '[]'),
(261, 'DUMMY', 261, '7896022204891', 261, NULL, NULL, 1.6800, 1.6800, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 18:00:10', NULL, '[]'),
(262, 'DUMMY', 262, '7896080862149', 262, NULL, NULL, 6.9800, 6.9800, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-02 18:00:56', NULL, '[]'),
(263, 'DUMMY', 263, '7896022207076', 263, NULL, NULL, 1.8900, 1.8900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 18:01:14', NULL, '[]'),
(264, 'DUMMY', 264, '7896058258660', 264, NULL, NULL, 2.8500, 2.8500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 18:04:17', NULL, '[]'),
(265, 'DUMMY', 265, '0265', 265, NULL, NULL, 0.3000, 0.3000, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-02 18:09:03', NULL, '[]'),
(266, 'DUMMY', 266, '7899074789125', 266, NULL, NULL, 0.6200, 0.6200, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-02 18:11:14', NULL, '[]'),
(267, 'DUMMY', 267, '7891962067889', 267, NULL, NULL, 2.0900, 2.0900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 18:12:04', NULL, '[]'),
(268, 'DUMMY', 268, '7891962067346', 268, NULL, NULL, 2.0900, 2.0900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 18:12:51', NULL, '[]'),
(269, 'DUMMY', 269, '0269', 269, NULL, NULL, 1.6500, 1.6500, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 18:13:27', NULL, '[]'),
(270, 'DUMMY', 270, '78939301', 270, NULL, NULL, 1.1800, 1.1800, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 18:15:53', NULL, '[]'),
(271, 'DUMMY', 271, '7893845569053', 271, NULL, NULL, 0.7900, 0.7900, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 18:17:08', NULL, '[]'),
(272, 'DUMMY', 272, '7892421057205', 272, NULL, NULL, 1.7900, 1.7900, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 18:17:33', NULL, '[]'),
(274, 'DUMMY', 274, '7895800002964', 274, NULL, NULL, 0.2500, 0.2500, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-02 18:27:53', NULL, '[]'),
(277, 'DUMMY', 277, '7896015960360', 277, NULL, NULL, 4.4500, 4.4500, 0.0000, 6.5000, 6.5000, '2026-02-02 09:40:17', '2026-02-02 18:42:13', NULL, '[]'),
(278, 'DUMMY', 278, '7896451913586', 278, NULL, NULL, 0.8300, 0.8300, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 18:46:53', NULL, '[]'),
(279, 'DUMMY', 279, '7896451912527', 279, NULL, NULL, 0.8300, 0.8300, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 18:44:20', NULL, '[]'),
(280, 'DUMMY', 280, '7896451912510', 280, NULL, NULL, 0.8300, 0.8300, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 18:44:59', NULL, '[]'),
(281, 'DUMMY', 281, '7896451912503', 281, NULL, NULL, 0.8300, 0.8300, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 18:45:57', NULL, '[]'),
(282, 'DUMMY', 282, '0282', 282, NULL, NULL, 0.1800, 0.1800, 0.0000, 0.2500, 0.2500, '2026-02-02 09:40:17', '2026-02-02 18:48:20', NULL, '[]'),
(283, 'DUMMY', 283, '7896691101002', 283, NULL, NULL, 7.0000, 7.0000, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-02 18:49:29', NULL, '[]'),
(284, 'DUMMY', 284, '7908274801817', 284, NULL, NULL, 2.0300, 2.0300, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 18:51:37', NULL, '[]'),
(286, 'DUMMY', 286, '7896043360309', 286, NULL, NULL, 0.3200, 0.3200, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-02 19:03:28', NULL, '[]'),
(288, 'DUMMY', 288, '7898932826033', 288, NULL, NULL, 1.8000, 1.8000, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 20:58:17', NULL, '[]'),
(289, 'DUMMY', 289, '7892532396118', 289, NULL, NULL, 2.6900, 2.6900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 17:04:29', NULL, '[]'),
(290, 'DUMMY', 290, '7896058500189', 290, NULL, NULL, 1.1700, 1.1700, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-03 17:02:23', NULL, '[]'),
(291, 'DUMMY', 291, '7896058591743', 291, NULL, NULL, 1.1700, 1.1700, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-05 15:06:47', NULL, '[]'),
(292, 'DUMMY', 292, '0619205818893', 292, NULL, NULL, 1.7200, 1.7200, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-05 15:08:50', NULL, '[]'),
(293, 'DUMMY', 293, '751320849250', 293, NULL, NULL, 0.2700, 0.2700, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:17', '2026-02-05 15:09:53', NULL, '[]'),
(294, 'DUMMY', 294, '7896451911582', 294, NULL, NULL, 0.6000, 0.6000, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-05 15:22:58', NULL, '[]'),
(295, 'DUMMY', 295, '7892625110676', 295, NULL, NULL, 5.9900, 5.9900, 0.0000, 7.5000, 7.5000, '2026-02-02 09:40:17', '2026-02-03 17:01:42', NULL, '[]'),
(296, 'DUMMY', 296, '0296', 296, NULL, NULL, 0.1000, 0.1000, 0.0000, 0.2000, 0.2000, '2026-02-02 09:40:17', '2026-02-05 15:52:16', NULL, '[]'),
(297, 'DUMMY', 297, '7896221401756', 297, NULL, NULL, 3.1200, 3.1200, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-03 17:01:25', NULL, '[]'),
(298, 'DUMMY', 298, '7896423701005', 298, NULL, NULL, 3.7900, 3.7900, 0.0000, 4.9900, 4.9900, '2026-02-02 09:40:17', '2026-02-03 17:04:46', NULL, '[]'),
(299, 'DUMMY', 299, '7896423702811', 299, NULL, NULL, 3.5500, 3.5500, 0.0000, 4.9900, 4.9900, '2026-02-02 09:40:17', '2026-02-03 16:52:04', NULL, '[]'),
(300, 'DUMMY', 300, '7897406610017', 300, NULL, NULL, 5.8900, 5.8900, 0.0000, 7.9900, 7.9900, '2026-02-02 09:40:17', '2026-02-05 16:24:37', NULL, '[]'),
(301, 'DUMMY', 301, '7896043353295', 301, NULL, NULL, 0.2500, 0.2500, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-05 16:21:14', NULL, '[]'),
(302, 'DUMMY', 302, '7896043353332', 302, NULL, NULL, 0.2500, 0.2500, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-05 16:22:09', NULL, '[]'),
(303, 'DUMMY', 303, '7899142142258', 303, NULL, NULL, 0.8300, 0.8300, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-05 16:26:34', NULL, '[]'),
(304, 'DUMMY', 304, '7891151039734', 304, NULL, NULL, 1.2900, 1.2900, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-05 17:28:51', NULL, '[]'),
(305, 'DUMMY', 305, '7891151039796', 305, NULL, NULL, 1.2900, 1.2900, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-05 17:29:42', NULL, '[]'),
(306, 'DUMMY', 306, '7891151039758', 306, NULL, NULL, 1.2900, 1.2900, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-05 17:27:03', NULL, '[]'),
(307, 'DUMMY', 307, '7891151039772', 307, NULL, NULL, 1.2900, 1.2900, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-05 17:27:45', NULL, '[]'),
(308, 'DUMMY', 308, '7896221400575', 308, NULL, NULL, 3.0000, 3.0000, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-05 17:32:30', NULL, '[]'),
(309, 'DUMMY', 309, '7896221400582', 309, NULL, NULL, 3.0000, 3.0000, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-05 17:33:12', NULL, '[]'),
(310, 'DUMMY', 310, '7897010905448', 310, NULL, NULL, 12.0800, 12.0800, 0.0000, 15.0000, 15.0000, '2026-02-02 09:40:17', '2026-02-03 11:04:22', NULL, '[]'),
(311, 'DUMMY', 311, '7896835117197', 311, NULL, NULL, 7.0900, 7.0900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-07 09:28:42', NULL, '[]'),
(312, 'DUMMY', 312, '7891000397107', 312, NULL, NULL, 5.7900, 5.7900, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:17', '2026-02-07 09:29:38', NULL, '[]'),
(313, 'DUMMY', 313, '7896292312159', 313, NULL, NULL, 1.6900, 1.6900, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(314, 'DUMMY', 314, '7896451912893', 314, NULL, NULL, 1.0700, 1.0700, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-03 17:03:47', NULL, '[]'),
(315, 'DUMMY', 315, '7896451912886', 315, NULL, NULL, 1.0700, 1.0700, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-03 11:00:59', NULL, '[]'),
(316, 'DUMMY', 316, '7894167513236', 316, NULL, NULL, 0.7200, 0.7200, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-03 10:56:53', NULL, '[]'),
(317, 'DUMMY', 317, '7897190307582', 317, NULL, NULL, 0.5000, 0.5000, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:17', '2026-02-07 10:10:09', NULL, '[]'),
(318, 'DUMMY', 318, '78938816', 318, NULL, NULL, 1.5600, 1.5600, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-03 10:48:55', NULL, '[]'),
(319, 'DUMMY', 319, '78938793', 319, NULL, NULL, 1.5600, 1.5600, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-03 10:49:20', NULL, '[]'),
(320, 'DUMMY', 320, '78938830', 320, NULL, NULL, 1.5600, 1.5600, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-07 10:11:37', NULL, '[]'),
(321, 'DUMMY', 321, '7894000030470', 321, NULL, NULL, 7.0900, 7.0900, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:17', '2026-02-03 10:18:10', NULL, '[]'),
(322, 'DUMMY', 322, '7896221400056', 322, NULL, NULL, 1.8000, 1.8000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-11 09:32:42', NULL, '[]'),
(323, 'DUMMY', 323, '7896221400667', 323, NULL, NULL, 1.8000, 1.8000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-11 09:33:29', NULL, '[]'),
(324, 'DUMMY', 324, '7896221400131', 324, NULL, NULL, 1.8000, 1.8000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-11 09:34:46', NULL, '[]'),
(325, 'DUMMY', 325, '7896221400018', 325, NULL, NULL, 0.4100, 0.4100, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-11 09:35:31', NULL, '[]'),
(326, 'DUMMY', 326, '7896876085585', 326, NULL, NULL, 4.4900, 4.4900, 0.0000, 5.7500, 5.7500, '2026-02-02 09:40:17', '2026-02-03 08:38:46', NULL, '[]'),
(327, 'DUMMY', 327, '0327', 327, NULL, NULL, 0.1100, 0.1100, 0.0000, 0.2000, 0.2000, '2026-02-02 09:40:17', '2026-02-03 16:59:09', NULL, '[]'),
(328, 'DUMMY', 328, '7896221400483', 328, NULL, NULL, 2.5000, 2.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 10:38:00', NULL, '[]'),
(329, 'DUMMY', 329, '7896221400087', 329, NULL, NULL, 2.5000, 2.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-11 09:52:50', NULL, '[]'),
(330, 'DUMMY', 330, '7896221401749', 330, NULL, NULL, 2.5000, 2.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-11 09:50:22', NULL, '[]'),
(331, 'DUMMY', 331, '7896221402456', 331, NULL, NULL, 2.5000, 2.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-11 09:51:03', NULL, '[]'),
(332, 'DUMMY', 332, '7896221402357', 332, NULL, NULL, 2.5000, 2.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-11 09:51:49', NULL, '[]'),
(333, 'DUMMY', 333, '7622210528216', 333, NULL, NULL, 8.1900, 8.1900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-11 09:54:00', NULL, '[]'),
(334, 'DUMMY', 334, '7622210673831', 334, NULL, NULL, 7.7900, 7.7900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-11 09:54:39', NULL, '[]'),
(335, 'DUMMY', 335, '7896423703313', 335, NULL, NULL, 8.7500, 8.7500, 0.0000, 11.9900, 11.9900, '2026-02-02 09:40:17', '2026-02-03 10:35:21', NULL, '[]'),
(336, 'DUMMY', 336, '7896705912778', 336, NULL, NULL, 2.6500, 2.6500, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-11 09:57:51', NULL, '[]'),
(337, 'DUMMY', 337, '7898215151708', 337, NULL, NULL, 4.9800, 4.9800, 0.0000, 7.9900, 7.9900, '2026-02-02 09:40:17', '2026-02-11 09:59:22', NULL, '[]'),
(338, 'DUMMY', 338, '7898215152439', 338, NULL, NULL, 19.4800, 19.4800, 0.0000, 24.5000, 24.5000, '2026-02-02 09:40:17', '2026-02-03 10:34:36', NULL, '[]'),
(339, 'DUMMY', 339, '7896434920549', 339, NULL, NULL, 4.9900, 4.9900, 0.0000, 6.9900, 6.9900, '2026-02-02 09:40:17', '2026-02-11 10:00:12', NULL, '[]'),
(340, 'DUMMY', 340, '7896080871141', 340, NULL, NULL, 5.9900, 5.9900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-11 10:02:22', NULL, '[]'),
(341, 'DUMMY', 341, '7896080861142', 341, NULL, NULL, 6.9800, 6.9800, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-11 10:03:24', NULL, '[]'),
(342, 'DUMMY', 342, '7896705900171', 342, NULL, NULL, 1.3500, 1.3500, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-11 14:32:59', NULL, '[]');
INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `woocommerce_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(343, 'DUMMY', 343, '7896423700848', 343, NULL, NULL, 2.4900, 2.4900, 0.0000, 4.9900, 4.9900, '2026-02-02 09:40:17', '2026-02-11 14:34:35', NULL, '[]'),
(344, 'DUMMY', 344, '7893000394117', 344, NULL, NULL, 5.0500, 5.0500, 0.0000, 7.7500, 7.7500, '2026-02-02 09:40:17', '2026-02-11 14:43:04', NULL, '[]'),
(345, 'DUMMY', 345, '7896451908377', 345, NULL, NULL, 1.1000, 1.1000, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-12 09:24:12', NULL, '[]'),
(346, 'DUMMY', 346, '7896451907660', 346, NULL, NULL, 1.1000, 1.1000, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-03 10:01:13', NULL, '[]'),
(347, 'DUMMY', 347, '7896451907189', 347, NULL, NULL, 1.1000, 1.1000, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-12 09:25:27', NULL, '[]'),
(348, 'DUMMY', 348, '7896423705324', 348, NULL, NULL, 1.5500, 1.5500, 0.0000, 2.9900, 2.9900, '2026-02-02 09:40:17', '2026-02-12 09:26:52', NULL, '[]'),
(349, 'DUMMY', 349, '7896423705317', 349, NULL, NULL, 1.5500, 1.5500, 0.0000, 2.9900, 2.9900, '2026-02-02 09:40:17', '2026-02-12 09:27:44', NULL, '[]'),
(350, 'DUMMY', 350, '7891079000229', 350, NULL, NULL, 1.9500, 1.9500, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-12 09:28:39', NULL, '[]'),
(351, 'DUMMY', 351, '7891079011775', 351, NULL, NULL, 2.6900, 2.6900, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-12 09:29:43', NULL, '[]'),
(352, 'DUMMY', 352, '7891079000311', 352, NULL, NULL, 2.6900, 2.6900, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-12 09:30:32', NULL, '[]'),
(353, 'DUMMY', 353, '7891079014028', 353, NULL, NULL, 2.6900, 2.6900, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-12 09:31:17', NULL, '[]'),
(354, 'DUMMY', 354, '7891079000205', 354, NULL, NULL, 2.8500, 2.8500, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-12 09:31:55', NULL, '[]'),
(355, 'DUMMY', 355, '7895786123691', 355, NULL, NULL, 1.4900, 1.4900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-12 09:32:32', NULL, '[]'),
(356, 'DUMMY', 356, '7896022205447', 356, NULL, NULL, 4.7900, 4.7900, 0.0000, 5.9900, 5.9900, '2026-02-02 09:40:17', '2026-02-12 09:33:13', NULL, '[]'),
(357, 'DUMMY', 357, '7894163079330', 357, NULL, NULL, 3.4900, 3.4900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-03 17:05:51', NULL, '[]'),
(358, 'DUMMY', 358, '7895730692679', 358, NULL, NULL, 3.4900, 3.4900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-12 09:40:40', NULL, '[]'),
(359, 'DUMMY', 359, '7897406602203', 359, NULL, NULL, 2.1900, 2.1900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-03 09:59:24', NULL, '[]'),
(360, 'DUMMY', 360, '7896292333000', 360, NULL, NULL, 1.7900, 1.7900, 0.0000, 3.4900, 3.4900, '2026-02-02 09:40:17', '2026-02-12 09:42:29', NULL, '[]'),
(361, 'DUMMY', 361, '7891000426210', 361, NULL, NULL, 11.4500, 11.4500, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-03 09:45:30', NULL, '[]'),
(362, 'DUMMY', 362, '7891000438503', 362, NULL, NULL, 6.7500, 6.7500, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-03 09:45:09', NULL, '[]'),
(363, 'DUMMY', 363, '7891000325131', 363, NULL, NULL, 15.0000, 15.0000, 0.0000, 19.0000, 19.0000, '2026-02-02 09:40:17', '2026-02-03 09:44:41', NULL, '[]'),
(364, 'DUMMY', 364, '0364', 364, NULL, NULL, 0.4400, 0.4400, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:17', '2026-02-03 09:43:49', NULL, '[]'),
(365, 'DUMMY', 365, '7895944896283', 365, NULL, NULL, 1.5500, 1.5500, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-12 11:50:01', NULL, '[]'),
(366, 'DUMMY', 366, '78939318', 366, NULL, NULL, 1.1800, 1.1800, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-12 11:53:02', NULL, '[]'),
(367, 'DUMMY', 367, '7892307752439', 367, NULL, NULL, 0.6300, 0.6300, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:17', '2026-02-03 09:17:56', NULL, '[]'),
(368, 'DUMMY', 368, '7897047000628', 368, NULL, NULL, 0.3500, 0.3500, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:17', '2026-02-12 11:55:47', NULL, '[]'),
(369, 'DUMMY', 369, '7891163752461', 369, NULL, NULL, 1.2500, 1.2500, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-12 11:56:38', NULL, '[]'),
(370, 'DUMMY', 370, '7898929246226', 370, NULL, NULL, 1.3900, 1.3900, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-12 11:59:40', NULL, '[]'),
(371, 'DUMMY', 371, '7898929246172', 371, NULL, NULL, 1.3900, 1.3900, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-12 12:00:27', NULL, '[]'),
(372, 'DUMMY', 372, '7898929246561', 372, NULL, NULL, 1.3900, 1.3900, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-12 12:01:10', NULL, '[]'),
(373, 'DUMMY', 373, '7892833889104', 373, NULL, NULL, 0.7500, 0.7500, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:17', '2026-02-12 12:02:11', NULL, '[]'),
(374, 'DUMMY', 374, '7891962051338', 374, NULL, NULL, 6.5000, 6.5000, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-12 13:58:34', NULL, '[]'),
(375, 'DUMMY', 375, '7776507001750', 375, NULL, NULL, 4.2500, 4.2500, 0.0000, 10.9900, 10.9900, '2026-02-02 09:40:17', '2026-02-12 14:01:24', NULL, '[]'),
(376, 'DUMMY', 376, '7897051580246', 376, NULL, NULL, 5.8000, 5.8000, 0.0000, 7.5000, 7.5000, '2026-02-02 09:40:17', '2026-02-03 08:31:42', NULL, '[]'),
(377, 'DUMMY', 377, '7891000241356', 377, NULL, NULL, 2.5000, 2.5000, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-03 09:03:38', NULL, '[]'),
(378, 'DUMMY', 378, '7891000259351', 378, NULL, NULL, 2.5000, 2.5000, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-12 14:03:05', NULL, '[]'),
(379, 'DUMMY', 379, '7897047002288', 379, NULL, NULL, 0.3500, 0.3500, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:17', '2026-02-12 14:04:00', NULL, '[]'),
(380, 'DUMMY', 380, '0380', 380, NULL, NULL, 1.2000, 1.2000, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-12 14:05:00', NULL, '[]'),
(381, 'DUMMY', 381, '7896058595420', 381, NULL, NULL, 1.6500, 1.6500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-12 14:12:36', NULL, '[]'),
(382, 'DUMMY', 382, '7896058596748', 382, NULL, NULL, 1.6500, 1.6500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-12 14:13:18', NULL, '[]'),
(383, 'DUMMY', 383, '7893130512658', 383, NULL, NULL, 2.7000, 2.7000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 10:40:21', NULL, '[]'),
(384, 'DUMMY', 384, '7899341329290', 384, NULL, NULL, 0.1100, 0.1100, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-03 08:52:55', NULL, '[]'),
(385, 'DUMMY', 385, '7897332000197', 385, NULL, NULL, 6.9900, 6.9900, 0.0000, 9.5000, 9.5000, '2026-02-02 09:40:17', '2026-02-12 14:20:00', NULL, '[]'),
(386, 'DUMMY', 386, '7898656685091', 386, NULL, NULL, 1.1500, 1.1500, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(387, 'DUMMY', 387, '7898656685152', 387, NULL, NULL, 1.1500, 1.1500, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(388, 'DUMMY', 388, '7891097105074', 388, NULL, NULL, 7.5900, 7.5900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(389, 'DUMMY', 389, '7891000460207', 389, NULL, NULL, 2.6200, 2.6200, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(390, 'DUMMY', 390, '7898929246387', 390, NULL, NULL, 1.5000, 1.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(391, 'DUMMY', 391, '7898240320070', 391, NULL, NULL, 2.7900, 2.7900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(392, 'DUMMY', 392, '7896022207106', 392, NULL, NULL, 1.8500, 1.8500, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(393, 'DUMMY', 393, '7891340365132', 393, NULL, NULL, 5.7900, 5.7900, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(394, 'DUMMY', 394, '7891340330116', 394, NULL, NULL, 5.7900, 5.7900, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(395, 'DUMMY', 395, '7891340330314', 395, NULL, NULL, 5.7900, 5.7900, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(396, 'DUMMY', 396, '7891340330215', 396, NULL, NULL, 5.7900, 5.7900, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(397, 'DUMMY', 397, '7896253401465', 397, NULL, NULL, 5.0000, 5.0000, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(398, 'DUMMY', 398, '7896253402141', 398, NULL, NULL, 6.4900, 6.4900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(399, 'DUMMY', 399, '7899735280008', 399, NULL, NULL, 6.3000, 6.3000, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(400, 'DUMMY', 400, '7891515598266', 400, NULL, NULL, 9.9500, 9.9500, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(401, 'DUMMY', 401, '7896071019446', 401, NULL, NULL, 1.1800, 1.1800, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(402, 'DUMMY', 402, '7896071019439', 402, NULL, NULL, 1.1800, 1.1800, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(403, 'DUMMY', 403, '7896071019453', 403, NULL, NULL, 1.1800, 1.1800, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(404, 'DUMMY', 404, '7753026204329', 404, NULL, NULL, 6.0000, 6.0000, 0.0000, 12.9900, 12.9900, '2026-02-02 09:40:17', '2026-02-03 08:18:07', NULL, '[]'),
(405, 'DUMMY', 405, '7895901747948', 405, NULL, NULL, 2.1500, 2.1500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-12 14:28:05', NULL, '[]'),
(406, 'DUMMY', 406, '7896004007618', 406, NULL, NULL, 10.4900, 10.4900, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-13 16:54:53', NULL, '[]'),
(407, 'DUMMY', 407, '7899767512474', 407, NULL, NULL, 7.9100, 7.9100, 0.0000, 11.0000, 11.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(408, 'DUMMY', 408, '7899767512603', 408, NULL, NULL, 7.9100, 7.9100, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(409, 'DUMMY', 409, '78916982', 409, NULL, NULL, 1.5800, 1.5800, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-03 10:02:02', NULL, '[]'),
(410, 'DUMMY', 410, '7896221400506', 410, NULL, NULL, 1.8000, 1.8000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-03 07:59:01', NULL, '[]'),
(411, 'DUMMY', 411, '7896221400490', 411, NULL, NULL, 1.8000, 1.8000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(412, 'DUMMY', 412, '7896221400520', 412, NULL, NULL, 1.8000, 1.8000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(413, 'DUMMY', 413, '7891962052564', 413, NULL, NULL, 4.2000, 4.2000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(414, 'DUMMY', 414, '7896731683758', 414, NULL, NULL, 2.7500, 2.7500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 07:55:05', NULL, '[]'),
(415, 'DUMMY', 415, '7622210592668', 415, NULL, NULL, 3.3500, 3.3500, 0.0000, 4.7500, 4.7500, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(416, 'DUMMY', 416, '7622210592750', 416, NULL, NULL, 3.3500, 3.3500, 0.0000, 4.7500, 4.7500, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(417, 'DUMMY', 417, '7895800304228', 417, NULL, NULL, 2.0800, 2.0800, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-03 07:53:41', NULL, '[]'),
(418, 'DUMMY', 418, '7895800430002', 418, NULL, NULL, 2.0800, 2.0800, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(419, 'DUMMY', 419, '7895800304211', 419, NULL, NULL, 1.6100, 1.6100, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(420, 'DUMMY', 420, '7898014850512', 420, NULL, NULL, 6.1500, 6.1500, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(421, 'DUMMY', 421, '7896213006426', 421, NULL, NULL, 7.4900, 7.4900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-03 07:50:13', NULL, '[]'),
(422, 'DUMMY', 422, '7896213006242', 422, NULL, NULL, 4.9800, 4.9800, 0.0000, 8.5000, 8.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(423, 'DUMMY', 423, '7896022204945', 423, NULL, NULL, 2.2500, 2.2500, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(424, 'DUMMY', 424, '7897047003278', 424, NULL, NULL, 2.1600, 2.1600, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(425, 'DUMMY', 425, '7897047003292', 425, NULL, NULL, 2.1600, 2.1600, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(426, 'DUMMY', 426, '7896022204952', 426, NULL, NULL, 2.2500, 2.2500, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(427, 'DUMMY', 427, '7896902209152', 427, NULL, NULL, 3.8500, 3.8500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 15:52:30', NULL, '[]'),
(428, 'DUMMY', 428, '7908324404005', 428, NULL, NULL, 1.9500, 1.9500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-02 16:55:54', NULL, '[]'),
(430, 'DUMMY', 430, '7897664171725', 430, NULL, NULL, 0.9900, 0.9900, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-02 16:57:08', NULL, '[]'),
(431, 'DUMMY', 431, '7908324404012', 431, NULL, NULL, 0.9900, 0.9900, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-02 16:58:24', NULL, '[]'),
(432, 'DUMMY', 432, '7897664171756', 432, NULL, NULL, 0.9900, 0.9900, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-02 16:59:19', NULL, '[]'),
(433, 'DUMMY', 433, '7898948550601', 433, NULL, NULL, 6.9900, 6.9900, 0.0000, 11.0000, 11.0000, '2026-02-02 09:40:17', '2026-02-02 17:01:10', NULL, '[]'),
(434, 'DUMMY', 434, '7896090704804', 434, NULL, NULL, 9.0000, 9.0000, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:17', '2026-02-02 17:02:01', NULL, '[]'),
(435, 'DUMMY', 435, '7896397758579', 435, NULL, NULL, 7.4900, 7.4900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(436, 'DUMMY', 436, '7894376554372', 436, NULL, NULL, 7.0000, 7.0000, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-02 17:05:29', NULL, '[]'),
(437, 'DUMMY', 437, '7893742766838', 437, NULL, NULL, 3.3900, 3.3900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-02 17:06:04', NULL, '[]'),
(438, 'DUMMY', 438, '7896806700069', 438, NULL, NULL, 6.3500, 6.3500, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-02 17:49:39', NULL, '[]'),
(439, 'DUMMY', 439, '7896596133061', 439, NULL, NULL, 4.5900, 4.5900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 17:56:25', NULL, '[]'),
(440, 'DUMMY', 440, '070330717534', 440, NULL, NULL, 5.3900, 5.3900, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:17', '2026-02-02 17:56:47', NULL, '[]'),
(441, 'DUMMY', 441, '070330727984', 441, NULL, NULL, 4.4900, 4.4900, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:17', '2026-02-02 17:57:35', NULL, '[]'),
(442, 'DUMMY', 442, '070330717565', 442, NULL, NULL, 4.4900, 4.4900, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:17', '2026-02-02 17:58:18', NULL, '[]'),
(443, 'DUMMY', 443, '7891350033564', 443, NULL, NULL, 9.9000, 9.9000, 0.0000, 13.9900, 13.9900, '2026-02-02 09:40:17', '2026-02-02 17:59:51', NULL, '[]'),
(444, 'DUMMY', 444, '7890274009181', 444, NULL, NULL, 12.9800, 12.9800, 0.0000, 15.0000, 15.0000, '2026-02-02 09:40:17', '2026-02-02 18:18:01', NULL, '[]'),
(445, 'DUMMY', 445, '7891649786775', 445, NULL, NULL, 1.2500, 1.2500, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 19:13:50', NULL, '[]'),
(446, 'DUMMY', 446, '664441057865', 446, NULL, NULL, 1.2000, 1.2000, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-02 19:12:56', NULL, '[]'),
(447, 'DUMMY', 447, '7891024132371', 447, NULL, NULL, 7.2000, 7.2000, 0.0000, 11.9900, 11.9900, '2026-02-02 09:40:17', '2026-02-02 21:13:56', NULL, '[]'),
(448, 'DUMMY', 448, '7896004814162', 448, NULL, NULL, 3.1900, 3.1900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-05 08:48:04', NULL, '[]'),
(449, 'DUMMY', 449, '7891528029498', 449, NULL, NULL, 2.9900, 2.9900, 0.0000, 5.9900, 5.9900, '2026-02-02 09:40:17', '2026-02-03 08:12:41', NULL, '[]'),
(450, 'DUMMY', 450, '7898201575259', 450, NULL, NULL, 9.4900, 9.4900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:17', '2026-02-03 10:50:21', NULL, '[]'),
(451, 'DUMMY', 451, '7898201575266', 451, NULL, NULL, 9.4900, 9.4900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:17', '2026-02-05 14:41:35', NULL, '[]'),
(452, 'DUMMY', 452, '7898940257027', 452, NULL, NULL, 3.9900, 3.9900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-05 16:00:53', NULL, '[]'),
(453, 'DUMMY', 453, '7898940257041', 453, NULL, NULL, 8.1500, 8.1500, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:17', '2026-02-05 16:10:29', NULL, '[]'),
(454, 'DUMMY', 454, '7891176117493', 454, NULL, NULL, 2.7900, 2.7900, 0.0000, 3.4900, 3.4900, '2026-02-02 09:40:17', '2026-02-05 17:25:06', NULL, '[]'),
(455, 'DUMMY', 455, '7893044497942', 455, NULL, NULL, 3.4900, 3.4900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-03 10:59:34', NULL, '[]'),
(456, 'DUMMY', 456, '7896007545094', 456, NULL, NULL, 9.0000, 9.0000, 0.0000, 14.9900, 14.9900, '2026-02-02 09:40:17', '2026-02-03 10:43:44', NULL, '[]'),
(457, 'DUMMY', 457, '7896007540631', 457, NULL, NULL, 6.4500, 6.4500, 0.0000, 12.9900, 12.9900, '2026-02-02 09:40:17', '2026-02-11 09:29:03', NULL, '[]'),
(458, 'DUMMY', 458, '7509546689340', 458, NULL, NULL, 14.9000, 14.9000, 0.0000, 19.9900, 19.9900, '2026-02-02 09:40:17', '2026-02-11 09:46:52', NULL, '[]'),
(459, 'DUMMY', 459, '7509546674353', 459, NULL, NULL, 16.6900, 16.6900, 0.0000, 22.0000, 22.0000, '2026-02-02 09:40:17', '2026-02-11 09:47:38', NULL, '[]'),
(460, 'DUMMY', 460, '7509546668277', 460, NULL, NULL, 17.6500, 17.6500, 0.0000, 22.0000, 22.0000, '2026-02-02 09:40:17', '2026-02-11 09:48:17', NULL, '[]'),
(461, 'DUMMY', 461, '7509546689357', 461, NULL, NULL, 16.6900, 16.6900, 0.0000, 22.0000, 22.0000, '2026-02-02 09:40:17', '2026-02-11 09:48:59', NULL, '[]'),
(462, 'DUMMY', 462, '7896013544128', 462, NULL, NULL, 9.9000, 9.9000, 0.0000, 13.9900, 13.9900, '2026-02-02 09:40:17', '2026-02-11 14:43:56', NULL, '[]'),
(463, 'DUMMY', 463, '7896013544241', 463, NULL, NULL, 9.9000, 9.9000, 0.0000, 13.9900, 13.9900, '2026-02-02 09:40:17', '2026-02-11 15:43:26', NULL, '[]'),
(464, 'DUMMY', 464, '7896013544210', 464, NULL, NULL, 9.9000, 9.9000, 0.0000, 13.9900, 13.9900, '2026-02-02 09:40:17', '2026-02-12 08:46:18', NULL, '[]'),
(465, 'DUMMY', 465, '7896013544517', 465, NULL, NULL, 9.9000, 9.9000, 0.0000, 13.9900, 13.9900, '2026-02-02 09:40:17', '2026-02-12 08:47:14', NULL, '[]'),
(466, 'DUMMY', 466, '7899467145033', 466, NULL, NULL, 9.4800, 9.4800, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:17', '2026-02-03 10:15:31', NULL, '[]'),
(467, 'DUMMY', 467, '7896104992494', 467, NULL, NULL, 13.1500, 13.1500, 0.0000, 19.9900, 19.9900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(468, 'DUMMY', 468, '7896104993897', 468, NULL, NULL, 6.7900, 6.7900, 0.0000, 11.9900, 11.9900, '2026-02-02 09:40:17', '2026-02-12 09:15:51', NULL, '[]'),
(469, 'DUMMY', 469, '7896235353904', 469, NULL, NULL, 10.4500, 10.4500, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-12 09:44:13', NULL, '[]'),
(470, 'DUMMY', 470, '7898919411900', 470, NULL, NULL, 7.9900, 7.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-12 09:45:00', NULL, '[]'),
(471, 'DUMMY', 471, '7896235353911', 471, NULL, NULL, 7.9900, 7.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-12 09:46:58', NULL, '[]'),
(472, 'DUMMY', 472, '7891350034622', 472, NULL, NULL, 7.9900, 7.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-12 09:49:52', NULL, '[]'),
(473, 'DUMMY', 473, '7891350034646', 473, NULL, NULL, 7.9900, 7.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-12 09:51:33', NULL, '[]'),
(474, 'DUMMY', 474, '7896235354208', 474, NULL, NULL, 7.9900, 7.9900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-12 09:50:50', NULL, '[]'),
(475, 'DUMMY', 475, '4005900396938', 475, NULL, NULL, 13.9800, 13.9800, 0.0000, 17.0000, 17.0000, '2026-02-02 09:40:17', '2026-02-12 10:18:21', NULL, '[]'),
(476, 'DUMMY', 476, '4005900036728', 476, NULL, NULL, 13.9800, 13.9800, 0.0000, 17.0000, 17.0000, '2026-02-02 09:40:17', '2026-02-12 10:19:04', NULL, '[]'),
(477, 'DUMMY', 477, '4005808837311', 477, NULL, NULL, 13.9800, 13.9800, 0.0000, 17.0000, 17.0000, '2026-02-02 09:40:17', '2026-02-12 10:19:48', NULL, '[]'),
(478, 'DUMMY', 478, '7791969016036', 478, NULL, NULL, 13.9800, 13.9800, 0.0000, 17.0000, 17.0000, '2026-02-02 09:40:17', '2026-02-12 10:20:39', NULL, '[]'),
(479, 'DUMMY', 479, '4005900122186', 479, NULL, NULL, 13.9800, 13.9800, 0.0000, 17.0000, 17.0000, '2026-02-02 09:40:17', '2026-02-12 10:21:57', NULL, '[]'),
(480, 'DUMMY', 480, '4006000015378', 480, NULL, NULL, 13.9800, 13.9800, 0.0000, 17.0000, 17.0000, '2026-02-02 09:40:17', '2026-02-12 10:22:56', NULL, '[]'),
(481, 'DUMMY', 481, '7896026838252', 481, NULL, NULL, 3.5700, 3.5700, 0.0000, 4.9900, 4.9900, '2026-02-02 09:40:17', '2026-02-12 11:57:30', NULL, '[]'),
(482, 'DUMMY', 482, '7896180108031', 482, NULL, NULL, 15.9000, 15.9000, 0.0000, 20.0000, 20.0000, '2026-02-02 09:40:17', '2026-02-12 13:59:23', NULL, '[]'),
(483, 'DUMMY', 483, '7896180108017', 483, NULL, NULL, 5.7900, 5.7900, 0.0000, 9.9900, 9.9900, '2026-02-02 09:40:17', '2026-02-12 14:00:08', NULL, '[]'),
(484, 'DUMMY', 484, '0484', 484, NULL, NULL, 0.8300, 0.8300, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-12 14:16:27', NULL, '[]'),
(485, 'DUMMY', 485, '6952337300398', 485, NULL, NULL, 0.6700, 0.6700, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(486, 'DUMMY', 486, '7892036974751', 486, NULL, NULL, 12.9000, 12.9000, 0.0000, 16.0000, 16.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(487, 'DUMMY', 487, '7892634147687', 487, NULL, NULL, 1.7900, 1.7900, 0.0000, 3.4900, 3.4900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(488, 'DUMMY', 488, '7898908026085', 488, NULL, NULL, 0.9900, 0.9900, 0.0000, 2.4900, 2.4900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(489, 'DUMMY', 489, '7898908026078', 489, NULL, NULL, 0.8900, 0.8900, 0.0000, 2.4900, 2.4900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(490, 'DUMMY', 490, '7898908026061', 490, NULL, NULL, 0.8900, 0.8900, 0.0000, 2.4900, 2.4900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(492, 'DUMMY', 492, '7891150037397', 492, NULL, NULL, 6.9900, 6.9900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:17', '2026-02-03 08:16:11', NULL, '[]'),
(493, 'DUMMY', 493, '7509546667638', 493, NULL, NULL, 5.4500, 5.4500, 0.0000, 8.9900, 8.9900, '2026-02-02 09:40:17', '2026-02-03 08:13:05', NULL, '[]'),
(494, 'DUMMY', 494, '7890138447067', 494, NULL, NULL, 1.0800, 1.0800, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-05 16:37:32', NULL, '[]'),
(495, 'DUMMY', 495, '7893360909662', 495, NULL, NULL, 0.5800, 0.5800, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-05 16:38:30', NULL, '[]'),
(496, 'DUMMY', 496, '7899136764428', 496, NULL, NULL, 0.0000, 0.0000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-05 16:40:21', NULL, '[]'),
(497, 'DUMMY', 497, '7894202412012', 497, NULL, NULL, 0.7600, 0.7600, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-05 17:24:19', NULL, '[]'),
(498, 'DUMMY', 498, '7890654158430', 498, NULL, NULL, 4.9900, 4.9900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-02 15:44:00', NULL, '[]'),
(499, 'DUMMY', 499, '7896045507054', 499, NULL, NULL, 4.5900, 4.5900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 17:13:01', NULL, '[]'),
(500, 'DUMMY', 500, '7896045505319', 500, NULL, NULL, 3.0000, 3.0000, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-02 17:13:24', NULL, '[]'),
(501, 'DUMMY', 501, '7891991010061', 501, NULL, NULL, 2.4900, 2.4900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 17:21:55', NULL, '[]'),
(502, 'DUMMY', 502, '7893475909137', 502, NULL, NULL, 2.1600, 2.1600, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 17:18:47', NULL, '[]'),
(503, 'DUMMY', 503, '0503', 503, NULL, NULL, 2.5900, 2.5900, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-02 17:19:49', NULL, '[]'),
(504, 'DUMMY', 504, '7891149105564', 504, NULL, NULL, 4.7500, 4.7500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 17:55:34', NULL, '[]'),
(505, 'DUMMY', 505, '7891149103270', 505, NULL, NULL, 2.4900, 2.4900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 18:23:05', NULL, '[]'),
(506, 'DUMMY', 506, '7891149010509', 506, NULL, NULL, 3.0000, 3.0000, 0.0000, 4.5000, 4.5000, '2026-02-02 09:40:17', '2026-02-02 18:23:34', NULL, '[]'),
(507, 'DUMMY', 507, '7891149010103', 507, NULL, NULL, 2.2600, 2.2600, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(508, 'DUMMY', 508, '7891149104956', 508, NULL, NULL, 4.1000, 4.1000, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 18:25:07', NULL, '[]'),
(509, 'DUMMY', 509, '7891149104932', 509, NULL, NULL, 3.0000, 3.0000, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-02 18:26:16', NULL, '[]'),
(510, 'DUMMY', 510, '7840050003803', 510, NULL, NULL, 2.2500, 2.2500, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-02 18:30:22', NULL, '[]'),
(511, 'DUMMY', 511, '7891991014762', 511, NULL, NULL, 5.0900, 5.0900, 0.0000, 7.5000, 7.5000, '2026-02-02 09:40:17', '2026-02-02 18:30:43', NULL, '[]'),
(512, 'DUMMY', 512, '7899893979905', 512, NULL, NULL, 2.5600, 2.5600, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 18:30:58', NULL, '[]'),
(513, 'DUMMY', 513, '7899791440729', 513, NULL, NULL, 6.3400, 6.3400, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-02 21:15:38', NULL, '[]'),
(514, 'DUMMY', 514, '7891149108718', 514, NULL, NULL, 5.8600, 5.8600, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-03 17:07:17', NULL, '[]'),
(515, 'DUMMY', 515, '7891149108749', 515, NULL, NULL, 4.1000, 4.1000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-03 17:07:03', NULL, '[]'),
(516, 'DUMMY', 516, '7896052601882', 516, NULL, NULL, 2.5000, 2.5000, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-03 10:57:48', NULL, '[]'),
(517, 'DUMMY', 517, '7892840812850', 517, NULL, NULL, 4.1700, 4.1700, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-03 10:49:51', NULL, '[]'),
(518, 'DUMMY', 518, '78936683', 518, NULL, NULL, 5.3900, 5.3900, 0.0000, 8.5000, 8.5000, '2026-02-02 09:40:17', '2026-02-03 10:48:15', NULL, '[]'),
(519, 'DUMMY', 519, '78905498', 519, NULL, NULL, 11.8900, 11.8900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:17', '2026-02-07 12:57:47', NULL, '[]'),
(520, 'DUMMY', 520, '7898377661848', 520, NULL, NULL, 6.8900, 6.8900, 0.0000, 8.5000, 8.5000, '2026-02-02 09:40:17', '2026-02-03 10:47:23', NULL, '[]'),
(521, 'DUMMY', 521, '7897395000509', 521, NULL, NULL, 6.2500, 6.2500, 0.0000, 8.5000, 8.5000, '2026-02-02 09:40:17', '2026-02-11 09:26:17', NULL, '[]'),
(522, 'DUMMY', 522, '7898172660183', 522, NULL, NULL, 14.9500, 14.9500, 0.0000, 17.0000, 17.0000, '2026-02-02 09:40:17', '2026-02-03 10:42:31', NULL, '[]'),
(523, 'DUMMY', 523, '7898172660107', 523, NULL, NULL, 17.7500, 17.7500, 0.0000, 21.0000, 21.0000, '2026-02-02 09:40:17', '2026-02-11 09:31:46', NULL, '[]'),
(524, 'DUMMY', 524, '7897592850822', 524, NULL, NULL, 2.0000, 2.0000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-03 10:20:47', NULL, '[]'),
(525, 'DUMMY', 525, '7898942053948', 525, NULL, NULL, 1.8000, 1.8000, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-03 09:59:41', NULL, '[]'),
(526, 'DUMMY', 526, '7891991295086', 526, NULL, NULL, 3.1600, 3.1600, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-03 09:18:38', NULL, '[]'),
(527, 'DUMMY', 527, '7892849291038', 527, NULL, NULL, 2.6600, 2.6600, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 09:18:55', NULL, '[]'),
(528, 'DUMMY', 528, '78905351', 528, NULL, NULL, 10.4900, 10.4900, 0.0000, 11.0000, 11.0000, '2026-02-02 09:40:17', '2026-02-12 11:51:06', NULL, '[]'),
(529, 'DUMMY', 529, '7772106007469', 529, NULL, NULL, 2.4200, 2.4200, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-03 09:07:32', NULL, '[]'),
(530, 'DUMMY', 530, '7897395099329', 530, NULL, NULL, 2.8900, 2.8900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-12 14:14:33', NULL, '[]'),
(531, 'DUMMY', 531, '7891149200504', 531, NULL, NULL, 2.9800, 2.9800, 0.0000, 4.5000, 4.5000, '2026-02-02 09:40:17', '2026-02-03 08:14:34', NULL, '[]'),
(532, 'DUMMY', 532, '7891149103300', 532, NULL, NULL, 2.2400, 2.2400, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 08:14:17', NULL, '[]'),
(533, 'DUMMY', 533, '7891149103102', 533, NULL, NULL, 2.2500, 2.2500, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-03 08:13:58', NULL, '[]'),
(534, 'DUMMY', 534, '7891991297424', 534, NULL, NULL, 4.0700, 4.0700, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-12 14:25:57', NULL, '[]'),
(535, 'DUMMY', 535, '7891991305440', 535, NULL, NULL, 5.0000, 5.0000, 0.0000, 8.5000, 8.5000, '2026-02-02 09:40:17', '2026-02-03 08:12:12', NULL, '[]'),
(536, 'DUMMY', 536, '7891991297547', 536, NULL, NULL, 9.9800, 9.9800, 0.0000, 11.0000, 11.0000, '2026-02-02 09:40:17', '2026-02-12 14:26:58', NULL, '[]'),
(537, 'DUMMY', 537, '7891991015462', 537, NULL, NULL, 4.9500, 4.9500, 0.0000, 8.5000, 8.5000, '2026-02-02 09:40:17', '2026-02-03 08:11:01', NULL, '[]'),
(538, 'DUMMY', 538, '7890295842415', 538, NULL, NULL, 2.6600, 2.6600, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 08:04:22', NULL, '[]'),
(539, 'DUMMY', 539, '7891991010900', 539, NULL, NULL, 2.1600, 2.1600, 0.0000, 2.7500, 2.7500, '2026-02-02 09:40:17', '2026-02-12 14:29:37', NULL, '[]'),
(540, 'DUMMY', 540, '7894900660319', 540, NULL, NULL, 3.7900, 3.7900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-03 09:47:16', NULL, '[]'),
(541, 'DUMMY', 541, '7894900660265', 541, NULL, NULL, 3.7900, 3.7900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-13 16:53:40', NULL, '[]'),
(542, 'DUMMY', 542, '6893904660319', 542, NULL, NULL, 3.7900, 3.7900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-13 16:54:19', NULL, '[]'),
(543, 'DUMMY', 543, '7891149440603', 543, NULL, NULL, 2.9200, 2.9200, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-03 08:01:15', NULL, '[]'),
(544, 'DUMMY', 544, '7891991000840', 544, NULL, NULL, 2.9200, 2.9200, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-03 07:55:38', NULL, '[]'),
(545, 'DUMMY', 545, '7898942055980', 545, NULL, NULL, 4.3500, 4.3500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-03 07:48:27', NULL, '[]'),
(546, 'DUMMY', 546, '78420151', 546, NULL, NULL, 3.5000, 3.5000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 19:08:49', NULL, '[]'),
(547, 'DUMMY', 547, '78422216', 547, NULL, NULL, 3.5000, 3.5000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 19:09:43', NULL, '[]'),
(548, 'DUMMY', 548, '78401266', 548, NULL, NULL, 0.1500, 0.1500, 0.0000, 0.2500, 0.2500, '2026-02-02 09:40:17', '2026-02-03 10:44:58', NULL, '[]'),
(549, 'DUMMY', 549, '0549', 549, NULL, NULL, 0.1200, 0.1200, 0.0000, 0.2000, 0.2000, '2026-02-02 09:40:17', '2026-02-02 18:04:57', NULL, '[]'),
(550, 'DUMMY', 550, '0550', 550, NULL, NULL, 0.2500, 0.2500, 0.0000, 0.5000, 0.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(551, 'DUMMY', 551, '7896279600538', 551, NULL, NULL, 7.5500, 7.5500, 0.0000, 9.9900, 9.9900, '2026-02-02 09:40:17', '2026-02-02 15:45:25', NULL, '[]'),
(552, 'DUMMY', 552, '7898247780075', 552, NULL, NULL, 5.9900, 5.9900, 0.0000, 8.9900, 8.9900, '2026-02-02 09:40:17', '2026-02-02 15:46:37', NULL, '[]'),
(553, 'DUMMY', 553, '7896800777777', 553, NULL, NULL, 17.8800, 17.8800, 0.0000, 21.0000, 21.0000, '2026-02-02 09:40:17', '2026-02-02 17:27:10', NULL, '[]'),
(554, 'DUMMY', 554, '7896800777661', 554, NULL, NULL, 4.1900, 4.1900, 0.0000, 8.9900, 8.9900, '2026-02-02 09:40:17', '2026-02-02 17:27:40', NULL, '[]'),
(555, 'DUMMY', 555, '7894233119010', 555, NULL, NULL, 4.9400, 4.9400, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 17:32:17', NULL, '[]'),
(556, 'DUMMY', 556, '7897406603897', 556, NULL, NULL, 2.6900, 2.6900, 0.0000, 5.5000, 5.5000, '2026-02-02 09:40:17', '2026-02-02 17:39:04', NULL, '[]'),
(557, 'DUMMY', 557, '7891167063365', 557, NULL, NULL, 4.6500, 4.6500, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 17:41:26', NULL, '[]'),
(558, 'DUMMY', 558, '7898645421594', 558, NULL, NULL, 8.8500, 8.8500, 0.0000, 11.0000, 11.0000, '2026-02-02 09:40:17', '2026-02-02 17:43:34', NULL, '[]'),
(559, 'DUMMY', 559, '7899549400050', 559, NULL, NULL, 4.4500, 4.4500, 0.0000, 6.9900, 6.9900, '2026-02-02 09:40:17', '2026-02-02 17:42:17', NULL, '[]'),
(560, 'DUMMY', 560, '7899549400012', 560, NULL, NULL, 8.9900, 8.9900, 0.0000, 11.9900, 11.9900, '2026-02-02 09:40:17', '2026-02-02 17:44:29', NULL, '[]'),
(561, 'DUMMY', 561, '7896705900058', 561, NULL, NULL, 1.6900, 1.6900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(562, 'DUMMY', 562, '7891138387421', 562, NULL, NULL, 13.9000, 13.9000, 0.0000, 18.0000, 18.0000, '2026-02-02 09:40:17', '2026-02-02 18:31:20', NULL, '[]'),
(563, 'DUMMY', 563, '7897237802506', 563, NULL, NULL, 12.8500, 12.8500, 0.0000, 18.9900, 18.9900, '2026-02-02 09:40:17', '2026-02-02 18:31:32', NULL, '[]'),
(564, 'DUMMY', 564, '7891018427599', 564, NULL, NULL, 17.9000, 17.9000, 0.0000, 21.9900, 21.9900, '2026-02-02 09:40:17', '2026-02-02 18:31:46', NULL, '[]'),
(565, 'DUMMY', 565, '7896005800546', 565, NULL, NULL, 23.9000, 23.9000, 0.0000, 25.5000, 25.5000, '2026-02-02 09:40:17', '2026-02-02 18:32:24', NULL, '[]'),
(566, 'DUMMY', 566, '7897478100089', 566, NULL, NULL, 4.2700, 4.2700, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 18:59:26', NULL, '[]'),
(567, 'DUMMY', 567, '7898270963575', 567, NULL, NULL, 5.3500, 5.3500, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 19:00:08', NULL, '[]'),
(568, 'DUMMY', 568, '7893043266808', 568, NULL, NULL, 2.7500, 2.7500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 21:09:33', NULL, '[]'),
(569, 'DUMMY', 569, '7898596080321', 569, NULL, NULL, 4.2500, 4.2500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 21:11:46', NULL, '[]'),
(570, 'DUMMY', 570, '7891418270313', 570, NULL, NULL, 1.6900, 1.6900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-05 08:49:12', NULL, '[]'),
(571, 'DUMMY', 571, '7896705900140', 571, NULL, NULL, 1.1900, 1.1900, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-05 14:29:02', NULL, '[]'),
(572, 'DUMMY', 572, '7896423700015', 572, NULL, NULL, 4.0900, 4.0900, 0.0000, 5.9900, 5.9900, '2026-02-02 09:40:17', '2026-02-05 14:49:49', NULL, '[]'),
(573, 'DUMMY', 573, '7897478100164', 573, NULL, NULL, 7.3500, 7.3500, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-03 07:59:48', NULL, '[]'),
(574, 'DUMMY', 574, '7897517209650', 574, NULL, NULL, 2.7500, 2.7500, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-03 11:17:19', NULL, '[]'),
(575, 'DUMMY', 575, '7893781066647', 575, NULL, NULL, 2.3500, 2.3500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 08:29:56', NULL, '[]'),
(576, 'DUMMY', 576, '7898950284440', 576, NULL, NULL, 1.3600, 1.3600, 0.0000, 2.4900, 2.4900, '2026-02-02 09:40:17', '2026-02-05 16:14:28', NULL, '[]'),
(577, 'DUMMY', 577, '7897332000081', 577, NULL, NULL, 5.8900, 5.8900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-05 16:20:11', NULL, '[]'),
(578, 'DUMMY', 578, '7897406600964', 578, NULL, NULL, 4.9000, 4.9000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-03 16:56:44', NULL, '[]'),
(579, 'DUMMY', 579, '7896183901783', 579, NULL, NULL, 5.6900, 5.6900, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:17', '2026-02-03 16:55:44', NULL, '[]'),
(580, 'DUMMY', 580, '7898069920109', 580, NULL, NULL, 3.8900, 3.8900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-03 11:19:19', NULL, '[]'),
(581, 'DUMMY', 581, '7898409957970', 581, NULL, NULL, 1.9500, 1.9500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 16:52:30', NULL, '[]'),
(582, 'DUMMY', 582, '7896045112098', 582, NULL, NULL, 1.1900, 1.1900, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-05 17:33:47', NULL, '[]'),
(583, 'DUMMY', 583, '7896045112463', 583, NULL, NULL, 1.1900, 1.1900, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-05 17:34:28', NULL, '[]'),
(584, 'DUMMY', 584, '7896045112456', 584, NULL, NULL, 1.1900, 1.1900, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-05 17:35:16', NULL, '[]'),
(585, 'DUMMY', 585, '7896045112425', 585, NULL, NULL, 1.1900, 1.1900, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-05 17:35:57', NULL, '[]'),
(586, 'DUMMY', 586, '7896045112128', 586, NULL, NULL, 0.9500, 0.9500, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-05 17:36:44', NULL, '[]'),
(587, 'DUMMY', 587, '7896045112111', 587, NULL, NULL, 0.9500, 0.9500, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-06 11:25:34', NULL, '[]'),
(588, 'DUMMY', 588, '7896045112135', 588, NULL, NULL, 1.1900, 1.1900, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-06 11:24:35', NULL, '[]'),
(589, 'DUMMY', 589, '7896045112142', 589, NULL, NULL, 1.1900, 1.1900, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-06 11:27:00', NULL, '[]'),
(590, 'DUMMY', 590, '7896045112104', 590, NULL, NULL, 1.1900, 1.1900, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-06 11:28:08', NULL, '[]'),
(591, 'DUMMY', 591, '7896257832753', 591, NULL, NULL, 2.2900, 2.2900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-03 10:56:36', NULL, '[]'),
(592, 'DUMMY', 592, '7896292312180', 592, NULL, NULL, 1.6900, 1.6900, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-07 09:34:04', NULL, '[]'),
(593, 'DUMMY', 593, '7896292312166', 593, NULL, NULL, 1.6900, 1.6900, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:17', '2026-02-03 10:59:54', NULL, '[]'),
(594, 'DUMMY', 594, '7897977910332', 594, NULL, NULL, 2.7500, 2.7500, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-03 10:57:24', NULL, '[]'),
(595, 'DUMMY', 595, '7894000050034', 595, NULL, NULL, 11.9900, 11.9900, 0.0000, 14.5000, 14.5000, '2026-02-02 09:40:17', '2026-02-07 12:59:51', NULL, '[]'),
(596, 'DUMMY', 596, '7896705900072', 596, NULL, NULL, 1.5500, 1.5500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-11 09:43:09', NULL, '[]'),
(597, 'DUMMY', 597, '7896705900164', 597, NULL, NULL, 1.6900, 1.6900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-11 09:43:49', NULL, '[]'),
(598, 'DUMMY', 598, '7896705900041', 598, NULL, NULL, 1.6900, 1.6900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-11 09:44:32', NULL, '[]'),
(599, 'DUMMY', 599, '7896054903168', 599, NULL, NULL, 2.7500, 2.7500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-11 09:45:19', NULL, '[]'),
(600, 'DUMMY', 600, '7898215152002', 600, NULL, NULL, 5.8000, 5.8000, 0.0000, 8.9900, 8.9900, '2026-02-02 09:40:17', '2026-02-11 09:58:41', NULL, '[]'),
(601, 'DUMMY', 601, '7894000010014', 601, NULL, NULL, 5.7500, 5.7500, 0.0000, 6.9900, 6.9900, '2026-02-02 09:40:17', '2026-02-11 14:38:26', NULL, '[]'),
(602, 'DUMMY', 602, '7896056968684', 602, NULL, NULL, 0.8900, 0.8900, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:17', '2026-02-03 10:16:08', NULL, '[]'),
(603, 'DUMMY', 603, '7897517209544', 603, NULL, NULL, 3.1500, 3.1500, 0.0000, 5.5000, 5.5000, '2026-02-02 09:40:17', '2026-02-03 11:17:57', NULL, '[]'),
(604, 'DUMMY', 604, '7896022204914', 604, NULL, NULL, 4.7900, 4.7900, 0.0000, 5.9900, 5.9900, '2026-02-02 09:40:17', '2026-02-12 09:34:06', NULL, '[]'),
(605, 'DUMMY', 605, '7896022204181', 605, NULL, NULL, 4.7900, 4.7900, 0.0000, 5.9900, 5.9900, '2026-02-02 09:40:17', '2026-02-12 09:36:44', NULL, '[]'),
(606, 'DUMMY', 606, '7896022204204', 606, NULL, NULL, 4.7900, 4.7900, 0.0000, 5.9900, 5.9900, '2026-02-02 09:40:17', '2026-02-12 09:37:32', NULL, '[]'),
(607, 'DUMMY', 607, '7897517206086', 607, NULL, NULL, 2.6900, 2.6900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 11:16:36', NULL, '[]'),
(608, 'DUMMY', 608, '7897406610185', 608, NULL, NULL, 0.9800, 0.9800, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-12 09:43:36', NULL, '[]'),
(609, 'DUMMY', 609, '7896705900249', 609, NULL, NULL, 1.6900, 1.6900, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(610, 'DUMMY', 610, '7891095911356', 610, NULL, NULL, 4.0000, 4.0000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-03 08:58:58', NULL, '[]'),
(611, 'DUMMY', 611, '7898215151784', 611, NULL, NULL, 3.0000, 3.0000, 0.0000, 4.4900, 4.4900, '2026-02-02 09:40:17', '2026-02-12 14:18:28', NULL, '[]'),
(612, 'DUMMY', 612, '7894321631011', 612, NULL, NULL, 5.9900, 5.9900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:17', '2026-02-03 08:52:22', NULL, '[]'),
(613, 'DUMMY', 613, '7896292333123', 613, NULL, NULL, 2.8500, 2.8500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(614, 'DUMMY', 614, '7896292340503', 614, NULL, NULL, 2.6900, 2.6900, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(615, 'DUMMY', 615, '7891097090004', 615, NULL, NULL, 8.4900, 8.4900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(616, 'DUMMY', 616, '7622300119621', 616, NULL, NULL, 5.5500, 5.5500, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-03 08:20:50', NULL, '[]'),
(617, 'DUMMY', 617, '7896110194363', 617, NULL, NULL, 1.5500, 1.5500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(618, 'DUMMY', 618, '7896063700642', 618, NULL, NULL, 2.5900, 2.5900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(619, 'DUMMY', 619, '7891132019281', 619, NULL, NULL, 0.4100, 0.4100, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:17', '2026-02-03 08:17:24', NULL, '[]'),
(620, 'DUMMY', 620, '7891132019724', 620, NULL, NULL, 0.4100, 0.4100, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(621, 'DUMMY', 621, '7897517209674', 621, NULL, NULL, 5.4900, 5.4900, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-03 08:15:56', NULL, '[]'),
(622, 'DUMMY', 622, '7899767516861', 622, NULL, NULL, 7.9100, 7.9100, 0.0000, 11.0000, 11.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(623, 'DUMMY', 623, '7899767512528', 623, NULL, NULL, 7.9100, 7.9100, 0.0000, 11.0000, 11.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(624, 'DUMMY', 624, '7898389711029', 624, NULL, NULL, 1.2000, 1.2000, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:17', '2026-02-03 08:00:06', NULL, '[]'),
(625, 'DUMMY', 625, '7897406601244', 625, NULL, NULL, 3.0500, 3.0500, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(626, 'DUMMY', 626, '7897406604757', 626, NULL, NULL, 3.0500, 3.0500, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(627, 'DUMMY', 627, '7898924049501', 627, NULL, NULL, 4.2500, 4.2500, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(628, 'DUMMY', 628, '7896048284792', 628, NULL, NULL, 2.1500, 2.1500, 0.0000, 3.4900, 3.4900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(629, 'DUMMY', 629, '7896048284631', 629, NULL, NULL, 2.2900, 2.2900, 0.0000, 3.4900, 3.4900, '2026-02-02 09:40:17', '2026-02-03 07:49:04', NULL, '[]'),
(630, 'DUMMY', 630, '7897534833289', 630, NULL, NULL, 3.3800, 3.3800, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 16:14:38', NULL, '[]'),
(631, 'DUMMY', 631, '0631', 631, NULL, NULL, 2.8000, 2.8000, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-02 17:07:13', NULL, '[]'),
(632, 'DUMMY', 632, '7790520999436', 632, NULL, NULL, 8.0000, 8.0000, 0.0000, 11.9900, 11.9900, '2026-02-02 09:40:17', '2026-02-02 17:54:23', NULL, '[]'),
(633, 'DUMMY', 633, '7790520999429', 633, NULL, NULL, 8.0000, 8.0000, 0.0000, 11.9900, 11.9900, '2026-02-02 09:40:17', '2026-02-02 17:54:39', NULL, '[]'),
(634, 'DUMMY', 634, '7896090100101', 634, NULL, NULL, 2.9900, 2.9900, 0.0000, 5.9900, 5.9900, '2026-02-02 09:40:17', '2026-02-02 18:16:47', NULL, '[]'),
(635, 'DUMMY', 635, '826048500117', 635, NULL, NULL, 8.0000, 8.0000, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:17', '2026-02-02 18:50:43', NULL, '[]'),
(636, 'DUMMY', 636, '7896440501497', 636, NULL, NULL, 7.9900, 7.9900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-02 18:55:31', NULL, '[]'),
(637, 'DUMMY', 637, '7896098900215', 637, NULL, NULL, 1.9900, 1.9900, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-05 15:00:51', NULL, '[]'),
(638, 'DUMMY', 638, '7500435259583', 638, NULL, NULL, 28.9000, 28.9000, 0.0000, 30.0000, 30.0000, '2026-02-02 09:40:17', '2026-02-05 15:25:26', NULL, '[]'),
(639, 'DUMMY', 639, '7896314707871', 639, NULL, NULL, 0.9500, 0.9500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 16:59:39', NULL, '[]'),
(640, 'DUMMY', 640, '7897938903021', 640, NULL, NULL, 1.9900, 1.9900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-05 16:15:15', NULL, '[]'),
(641, 'DUMMY', 641, '7897938903014', 641, NULL, NULL, 1.9900, 1.9900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 16:58:11', NULL, '[]'),
(642, 'DUMMY', 642, '7897938903007', 642, NULL, NULL, 1.9900, 1.9900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-05 16:16:59', NULL, '[]'),
(643, 'DUMMY', 643, '7896404607692', 643, NULL, NULL, 7.9900, 7.9900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:17', '2026-02-07 09:36:45', NULL, '[]'),
(644, 'DUMMY', 644, '7896098909614', 644, NULL, NULL, 23.8500, 23.8500, 0.0000, 29.0000, 29.0000, '2026-02-02 09:40:17', '2026-02-11 09:49:39', NULL, '[]'),
(645, 'DUMMY', 645, '7898586612303', 645, NULL, NULL, 3.3500, 3.3500, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:17', '2026-02-12 10:01:06', NULL, '[]'),
(646, 'DUMMY', 646, '7898247330256', 646, NULL, NULL, 5.8800, 5.8800, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-12 11:43:54', NULL, '[]'),
(647, 'DUMMY', 647, '7898247330249', 647, NULL, NULL, 5.8800, 5.8800, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-12 11:45:01', NULL, '[]'),
(648, 'DUMMY', 648, '7898247330263', 648, NULL, NULL, 5.8800, 5.8800, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:17', '2026-02-12 11:45:49', NULL, '[]'),
(649, 'DUMMY', 649, '7891150069121', 649, NULL, NULL, 24.9000, 24.9000, 0.0000, 30.0000, 30.0000, '2026-02-02 09:40:17', '2026-02-12 11:47:47', NULL, '[]'),
(650, 'DUMMY', 650, '7891150064317', 650, NULL, NULL, 14.7800, 14.7800, 0.0000, 19.5000, 19.5000, '2026-02-02 09:40:17', '2026-02-03 09:42:40', NULL, '[]'),
(651, 'DUMMY', 651, '7898293130053', 651, NULL, NULL, 1.9900, 1.9900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-12 14:06:18', NULL, '[]'),
(652, 'DUMMY', 652, '7895121611005', 652, NULL, NULL, 1.5900, 1.5900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:17', '2026-02-03 08:51:56', NULL, '[]'),
(653, 'DUMMY', 653, '7896083800018', 653, NULL, NULL, 4.2500, 4.2500, 0.0000, 6.4900, 6.4900, '2026-02-02 09:40:17', '2026-02-03 08:35:42', NULL, '[]'),
(654, 'DUMMY', 654, '7897388600051', 654, NULL, NULL, 9.2000, 9.2000, 0.0000, 15.0000, 15.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(655, 'DUMMY', 655, '7896098905906', 655, NULL, NULL, 1.8000, 1.8000, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(656, 'DUMMY', 656, '7898247330225', 656, NULL, NULL, 1.2500, 1.2500, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(657, 'DUMMY', 657, '7896098909720', 657, NULL, NULL, 5.8900, 5.8900, 0.0000, 9.2500, 9.2500, '2026-02-02 09:40:17', '2026-02-03 07:57:46', NULL, '[]'),
(658, 'DUMMY', 658, '7896098909737', 658, NULL, NULL, 6.2000, 6.2000, 0.0000, 9.2500, 9.2500, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(659, 'DUMMY', 659, '7898293130565', 659, NULL, NULL, 3.9900, 3.9900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-03 08:20:36', NULL, '[]'),
(660, 'DUMMY', 660, '7896440501381', 660, NULL, NULL, 3.9900, 3.9900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(661, 'DUMMY', 661, '7897938905209', 661, NULL, NULL, 9.9000, 9.9000, 0.0000, 13.9900, 13.9900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(662, 'DUMMY', 662, '7896098909898', 662, NULL, NULL, 9.9900, 9.9900, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(663, 'DUMMY', 663, '7896527701420', 663, NULL, NULL, 9.4500, 9.4500, 0.0000, 13.5000, 13.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(664, 'DUMMY', 664, '7896527701437', 664, NULL, NULL, 9.4500, 9.4500, 0.0000, 13.5000, 13.5000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(665, 'DUMMY', 665, '7899633067152', 665, NULL, NULL, 1.9500, 1.9500, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:17', '2026-02-03 07:52:48', NULL, '[]'),
(666, 'DUMMY', 666, '7891242457324', 666, NULL, NULL, 9.9800, 9.9800, 0.0000, 13.7500, 13.7500, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(667, 'DUMMY', 667, '7891242457317', 667, NULL, NULL, 9.9800, 9.9800, 0.0000, 13.7500, 13.7500, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(668, 'DUMMY', 668, '7891242420137', 668, NULL, NULL, 23.9000, 23.9000, 0.0000, 30.0000, 30.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(669, 'DUMMY', 669, '7897388600860', 669, NULL, NULL, 11.9300, 11.9300, 0.0000, 17.0000, 17.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(670, 'DUMMY', 670, '7897388602079', 670, NULL, NULL, 9.2800, 9.2800, 0.0000, 15.0000, 15.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(671, 'DUMMY', 671, '7891035249433', 671, NULL, NULL, 5.8800, 5.8800, 0.0000, 9.4900, 9.4900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(672, 'DUMMY', 672, '7891035249228', 672, NULL, NULL, 5.8900, 5.8900, 0.0000, 9.4900, 9.4900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]');
INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `woocommerce_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(673, 'DUMMY', 673, '7896098902400', 673, NULL, NULL, 10.0500, 10.0500, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(674, 'DUMMY', 674, '7896098904091', 674, NULL, NULL, 4.2900, 4.2900, 0.0000, 7.9900, 7.9900, '2026-02-02 09:40:17', '2026-02-03 10:33:04', NULL, '[]'),
(675, 'DUMMY', 675, '7896098900406', 675, NULL, NULL, 3.7900, 3.7900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(676, 'DUMMY', 676, '7896098900413', 676, NULL, NULL, 3.7900, 3.7900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(677, 'DUMMY', 677, '7896098900239', 677, NULL, NULL, 1.9900, 1.9900, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:17', '2026-02-02 09:40:17', NULL, '[]'),
(678, 'DUMMY', 678, '7896098903629', 678, NULL, NULL, 3.1900, 3.1900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(679, 'DUMMY', 679, '7896098900222', 679, NULL, NULL, 1.9900, 1.9900, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(680, 'DUMMY', 680, '7896098902042', 680, NULL, NULL, 2.1500, 2.1500, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(681, 'DUMMY', 681, '7896098900208', 681, NULL, NULL, 1.9900, 1.9900, 0.0000, 3.9900, 3.9900, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(682, 'DUMMY', 682, '7896048920706', 682, NULL, NULL, 2.3500, 2.3500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-03 16:56:07', NULL, '[]'),
(683, 'DUMMY', 683, '7896048920607', 683, NULL, NULL, 2.3500, 2.3500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:18', '2026-02-05 16:23:57', NULL, '[]'),
(684, 'DUMMY', 684, '0684', 684, NULL, NULL, 9.0000, 9.0000, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-03 17:09:03', NULL, '[]'),
(685, 'DUMMY', 685, '7898180501645', 685, NULL, NULL, 6.0000, 6.0000, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(686, 'DUMMY', 686, '7898292370054', 686, NULL, NULL, 1.2500, 1.2500, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:18', '2026-02-02 15:58:25', NULL, '[]'),
(687, 'DUMMY', 687, '7898292370047', 687, NULL, NULL, 2.6700, 2.6700, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-02 16:00:08', NULL, '[]'),
(688, 'DUMMY', 688, '7898292370153', 688, NULL, NULL, 1.5400, 1.5400, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-02 16:00:47', NULL, '[]'),
(689, 'DUMMY', 689, '7894726747003', 689, NULL, NULL, 1.5000, 1.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(690, 'DUMMY', 690, '7896000593764', 690, NULL, NULL, 1.3500, 1.3500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:18', '2026-02-02 16:05:05', NULL, '[]'),
(691, 'DUMMY', 691, '7898778746410', 691, NULL, NULL, 2.7900, 2.7900, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:18', '2026-02-02 17:15:49', NULL, '[]'),
(692, 'DUMMY', 692, '7891000252833', 692, NULL, NULL, 3.0500, 3.0500, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-02 19:01:03', NULL, '[]'),
(693, 'DUMMY', 693, '7891000360668', 693, NULL, NULL, 3.0500, 3.0500, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-02 19:02:16', NULL, '[]'),
(694, 'DUMMY', 694, '77716088', 694, NULL, NULL, 6.1800, 6.1800, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-02 19:14:15', NULL, '[]'),
(695, 'DUMMY', 695, '7894900010015', 695, NULL, NULL, 3.4200, 3.4200, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-02 19:14:41', NULL, '[]'),
(696, 'DUMMY', 696, '7771609000960', 696, NULL, NULL, 9.1700, 9.1700, 0.0000, 15.0000, 15.0000, '2026-02-02 09:40:18', '2026-02-02 19:15:40', NULL, '[]'),
(697, 'DUMMY', 697, '7771605000889', 697, NULL, NULL, 5.7100, 5.7100, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-02 19:16:32', NULL, '[]'),
(698, 'DUMMY', 698, '77716064', 698, NULL, NULL, 2.4500, 2.4500, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-02 19:17:04', NULL, '[]'),
(699, 'DUMMY', 699, '7894900010398', 699, NULL, NULL, 2.2700, 2.2700, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:18', '2026-02-02 19:17:23', NULL, '[]'),
(700, 'DUMMY', 700, '7893774512151', 700, NULL, NULL, 2.1700, 2.1700, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:18', '2026-02-02 21:00:03', NULL, '[]'),
(702, 'DUMMY', 702, '7894900556063', 702, NULL, NULL, 6.6300, 6.6300, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:18', '2026-02-05 14:51:04', NULL, '[]'),
(703, 'DUMMY', 703, '7894900550061', 703, NULL, NULL, 6.6900, 6.6900, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:18', '2026-02-05 14:55:16', NULL, '[]'),
(704, 'DUMMY', 704, '7894900593709', 704, NULL, NULL, 2.4900, 2.4900, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:18', '2026-02-03 17:03:09', NULL, '[]'),
(705, 'DUMMY', 705, '7894900583700', 705, NULL, NULL, 2.4500, 2.4500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-05 14:56:46', NULL, '[]'),
(706, 'DUMMY', 706, '7896619811006', 706, NULL, NULL, 5.9900, 5.9900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-05 16:01:59', NULL, '[]'),
(707, 'DUMMY', 707, '7896718701949', 707, NULL, NULL, 8.5500, 8.5500, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-05 16:03:07', NULL, '[]'),
(708, 'DUMMY', 708, '7898942053306', 708, NULL, NULL, 8.9900, 8.9900, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:18', '2026-02-03 11:05:30', NULL, '[]'),
(709, 'DUMMY', 709, '7893630172710', 709, NULL, NULL, 8.5900, 8.5900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:18', '2026-02-03 08:25:08', NULL, '[]'),
(710, 'DUMMY', 710, '7771605000032', 710, NULL, NULL, 6.3200, 6.3200, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-03 16:56:58', NULL, '[]'),
(711, 'DUMMY', 711, '7892168380451', 711, NULL, NULL, 3.5000, 3.5000, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:18', '2026-02-03 11:18:19', NULL, '[]'),
(712, 'DUMMY', 712, '7898990913751', 712, NULL, NULL, 3.3400, 3.3400, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:18', '2026-02-03 11:18:36', NULL, '[]'),
(713, 'DUMMY', 713, '7896718700225', 713, NULL, NULL, 5.0000, 5.0000, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:18', '2026-02-03 11:12:58', NULL, '[]'),
(714, 'DUMMY', 714, '7891979724980', 714, NULL, NULL, 2.5000, 2.5000, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-07 09:40:41', NULL, '[]'),
(715, 'DUMMY', 715, '7772106004055', 715, NULL, NULL, 7.0600, 7.0600, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-07 09:44:20', NULL, '[]'),
(716, 'DUMMY', 716, '7891991000826', 716, NULL, NULL, 2.8300, 2.8300, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-03 11:04:02', NULL, '[]'),
(717, 'DUMMY', 717, '7899248262386', 717, NULL, NULL, 2.3400, 2.3400, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-03 10:18:54', NULL, '[]'),
(718, 'DUMMY', 718, '7893998656686', 718, NULL, NULL, 2.0900, 2.0900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-07 09:53:24', NULL, '[]'),
(719, 'DUMMY', 719, '7893518598700', 719, NULL, NULL, 3.9300, 3.9300, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-11 09:27:25', NULL, '[]'),
(720, 'DUMMY', 720, '7898938236034', 720, NULL, NULL, 5.2500, 5.2500, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:18', '2026-02-03 10:46:33', NULL, '[]'),
(721, 'DUMMY', 721, '7898938236010', 721, NULL, NULL, 7.8800, 7.8800, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-03 10:46:14', NULL, '[]'),
(722, 'DUMMY', 722, '7897307582970', 722, NULL, NULL, 2.5000, 2.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-03 10:45:47', NULL, '[]'),
(723, 'DUMMY', 723, '7895892600437', 723, NULL, NULL, 2.5000, 2.5000, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-03 10:38:39', NULL, '[]'),
(724, 'DUMMY', 724, '7897417400140', 724, NULL, NULL, 4.5000, 4.5000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:18', '2026-02-03 10:51:51', NULL, '[]'),
(725, 'DUMMY', 725, '7897417400157', 725, NULL, NULL, 4.5000, 4.5000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:18', '2026-02-03 10:20:21', NULL, '[]'),
(726, 'DUMMY', 726, '7897417402489', 726, NULL, NULL, 7.0000, 7.0000, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-03 10:54:29', NULL, '[]'),
(727, 'DUMMY', 727, '7897417403004', 727, NULL, NULL, 2.5000, 2.5000, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:18', '2026-02-11 14:39:18', NULL, '[]'),
(728, 'DUMMY', 728, '7896718701284', 728, NULL, NULL, 6.0000, 6.0000, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:18', '2026-02-03 10:18:29', NULL, '[]'),
(729, 'DUMMY', 729, '7898904435096', 729, NULL, NULL, 1.1500, 1.1500, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:18', '2026-02-03 10:00:24', NULL, '[]'),
(730, 'DUMMY', 730, '7084704323', 730, NULL, NULL, 7.9800, 7.9800, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:18', '2026-02-03 09:58:56', NULL, '[]'),
(731, 'DUMMY', 731, '070847033301', 731, NULL, NULL, 7.9800, 7.9800, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:18', '2026-02-12 09:56:40', NULL, '[]'),
(732, 'DUMMY', 732, '1220000250031', 732, NULL, NULL, 7.9800, 7.9800, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:18', '2026-02-12 09:59:29', NULL, '[]'),
(733, 'DUMMY', 733, '1220000250147', 733, NULL, NULL, 7.9500, 7.9500, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:18', '2026-02-12 09:57:31', NULL, '[]'),
(734, 'DUMMY', 734, '7898938890045', 734, NULL, NULL, 7.9500, 7.9500, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:18', '2026-02-12 09:58:13', NULL, '[]'),
(735, 'DUMMY', 735, '7898920195301', 735, NULL, NULL, 5.2500, 5.2500, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:18', '2026-02-12 10:23:38', NULL, '[]'),
(736, 'DUMMY', 736, '7898961490526', 736, NULL, NULL, 5.2500, 5.2500, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:18', '2026-02-12 10:24:22', NULL, '[]'),
(737, 'DUMMY', 737, '7898920195141', 737, NULL, NULL, 5.2500, 5.2500, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:18', '2026-02-12 10:25:10', NULL, '[]'),
(738, 'DUMMY', 738, '7772106001467', 738, NULL, NULL, 2.0000, 2.0000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:18', '2026-02-12 14:09:55', NULL, '[]'),
(739, 'DUMMY', 739, '7772106001436', 739, NULL, NULL, 4.0000, 4.0000, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:18', '2026-02-02 10:43:54', NULL, '[]'),
(740, 'DUMMY', 740, '7892766825583', 740, NULL, NULL, 5.8400, 5.8400, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:18', '2026-02-03 09:00:55', NULL, '[]'),
(741, 'DUMMY', 741, '7892840800079', 741, NULL, NULL, 2.4900, 2.4900, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-03 09:02:41', NULL, '[]'),
(742, 'DUMMY', 742, '7894842672883', 742, NULL, NULL, 2.6600, 2.6600, 0.0000, 4.0000, 4.0000, '2026-02-02 09:40:18', '2026-02-03 09:01:40', NULL, '[]'),
(743, 'DUMMY', 743, '7891779308113', 743, NULL, NULL, 0.4700, 0.4700, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:18', '2026-02-03 08:59:49', NULL, '[]'),
(744, 'DUMMY', 744, '7771609003268', 744, NULL, NULL, 4.6500, 4.6500, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:18', '2026-02-03 08:39:30', NULL, '[]'),
(745, 'DUMMY', 745, '9002490100070', 745, NULL, NULL, 8.7800, 8.7800, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-03 08:24:40', NULL, '[]'),
(746, 'DUMMY', 746, '7891457334991', 746, NULL, NULL, 4.6600, 4.6600, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:18', '2026-02-03 08:24:15', NULL, '[]'),
(747, 'DUMMY', 747, '7895689307303', 747, NULL, NULL, 2.9200, 2.9200, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-03 08:13:41', NULL, '[]'),
(748, 'DUMMY', 748, '7771605000049', 748, NULL, NULL, 6.3100, 6.3100, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-03 08:11:24', NULL, '[]'),
(749, 'DUMMY', 749, '7891149440801', 749, NULL, NULL, 5.8400, 5.8400, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-03 08:04:00', NULL, '[]'),
(750, 'DUMMY', 750, '7891149102808', 750, NULL, NULL, 5.4200, 5.4200, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-13 16:56:07', NULL, '[]'),
(751, 'DUMMY', 751, '7891991297172', 751, NULL, NULL, 5.4200, 5.4200, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-13 16:55:26', NULL, '[]'),
(752, 'DUMMY', 752, '7891149102785', 752, NULL, NULL, 2.6600, 2.6600, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-13 16:56:44', NULL, '[]'),
(753, 'DUMMY', 753, '7771224001755', 753, NULL, NULL, 7.2800, 7.2800, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-03 08:00:26', NULL, '[]'),
(754, 'DUMMY', 754, '7771224000765', 754, NULL, NULL, 2.6800, 2.6800, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-03 08:00:44', NULL, '[]'),
(755, 'DUMMY', 755, '7898215151807', 755, NULL, NULL, 1.4000, 1.4000, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:18', '2026-02-03 08:36:27', NULL, '[]'),
(756, 'DUMMY', 756, '7891999340108', 756, NULL, NULL, 2.4500, 2.4500, 0.0000, 3.7500, 3.7500, '2026-02-02 09:40:18', '2026-02-03 07:51:03', NULL, '[]'),
(757, 'DUMMY', 757, '7891999100047', 757, NULL, NULL, 2.3900, 2.3900, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(758, 'DUMMY', 758, '7898576190057', 758, NULL, NULL, 3.3400, 3.3400, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-02 18:32:43', NULL, '[]'),
(759, 'DUMMY', 759, '7891991304849', 759, NULL, NULL, 4.6000, 4.6000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(760, 'DUMMY', 760, '7896514701976', 760, NULL, NULL, 8.0900, 8.0900, 0.0000, 13.0000, 13.0000, '2026-02-02 09:40:18', '2026-02-02 18:53:16', NULL, '[]'),
(761, 'DUMMY', 761, '7898422675301', 761, NULL, NULL, 24.7500, 24.7500, 0.0000, 33.0000, 33.0000, '2026-02-02 09:40:18', '2026-02-12 11:46:47', NULL, '[]'),
(763, 'DUMMY', 763, '7896273100263', 763, NULL, NULL, 17.8500, 17.8500, 0.0000, 23.0000, 23.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(764, 'DUMMY', 764, '7898576190019', 764, NULL, NULL, 12.5000, 12.5000, 0.0000, 19.0000, 19.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(765, 'DUMMY', 765, '7898933283170', 765, NULL, NULL, 3.4500, 3.4500, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:18', '2026-02-02 17:07:36', NULL, '[]'),
(766, 'DUMMY', 766, '7899951622910', 766, NULL, NULL, 2.3000, 2.3000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(767, 'DUMMY', 767, '7890870310605', 767, NULL, NULL, 4.4000, 4.4000, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(768, 'DUMMY', 768, '7898671236063', 768, NULL, NULL, 8.0000, 8.0000, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-02 18:48:44', NULL, '[]'),
(769, 'DUMMY', 769, '78948037', 769, NULL, NULL, 6.8000, 6.8000, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:18', '2026-02-02 19:07:44', NULL, '[]'),
(770, 'DUMMY', 770, '7898636830374', 770, NULL, NULL, 7.9200, 7.9200, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-05 16:04:41', NULL, '[]'),
(771, 'DUMMY', 771, '7898636830435', 771, NULL, NULL, 7.9200, 7.9200, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-05 16:06:17', NULL, '[]'),
(772, 'DUMMY', 772, '7897042210442', 772, NULL, NULL, 5.2500, 5.2500, 0.0000, 7.0000, 7.0000, '2026-02-02 09:40:18', '2026-02-03 16:51:27', NULL, '[]'),
(773, 'DUMMY', 773, '7896080900117', 773, NULL, NULL, 0.2000, 0.2000, 0.0000, 1.0000, 1.0000, '2026-02-02 09:40:18', '2026-02-03 11:20:25', NULL, '[]'),
(774, 'DUMMY', 774, '7898970135029', 774, NULL, NULL, 3.2700, 3.2700, 0.0000, 5.0000, 5.0000, '2026-02-02 09:40:18', '2026-02-06 11:30:34', NULL, '[]'),
(775, 'DUMMY', 775, '7890015760661', 775, NULL, NULL, 2.0500, 2.0500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-07 10:08:42', NULL, '[]'),
(776, 'DUMMY', 776, '7892122598991', 776, NULL, NULL, 0.4700, 0.4700, 0.0000, 2.0000, 2.0000, '2026-02-02 09:40:18', '2026-02-11 09:29:53', NULL, '[]'),
(777, 'DUMMY', 777, '4000842868499', 777, NULL, NULL, 0.6800, 0.6800, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:18', '2026-02-11 09:30:33', NULL, '[]'),
(778, 'DUMMY', 778, '0778', 778, NULL, NULL, 13.0000, 13.0000, 0.0000, 18.0000, 18.0000, '2026-02-02 09:40:18', '2026-02-03 07:57:23', NULL, '[]'),
(779, 'DUMMY', 779, '7896104993903', 779, NULL, NULL, 8.6500, 8.6500, 0.0000, 14.0000, 14.0000, '2026-02-02 09:40:18', '2026-02-12 09:23:22', NULL, '[]'),
(780, 'DUMMY', 780, '7896104993880', 780, NULL, NULL, 10.9900, 10.9900, 0.0000, 15.0000, 15.0000, '2026-02-02 09:40:18', '2026-02-03 10:14:37', NULL, '[]'),
(781, 'DUMMY', 781, '0781', 781, NULL, NULL, 6.7500, 6.7500, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(782, 'DUMMY', 782, '7896080901442', 782, NULL, NULL, 1.4500, 1.4500, 0.0000, 2.5000, 2.5000, '2026-02-02 09:40:18', '2026-02-03 09:07:14', NULL, '[]'),
(783, 'DUMMY', 783, '7895466549193', 783, NULL, NULL, 1.1300, 1.1300, 0.0000, 3.0000, 3.0000, '2026-02-02 09:40:18', '2026-02-12 11:58:55', NULL, '[]'),
(784, 'DUMMY', 784, '7896914000716', 784, NULL, NULL, 4.4900, 4.4900, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:18', '2026-02-12 14:02:08', NULL, '[]'),
(785, 'DUMMY', 785, '7896067203170', 785, NULL, NULL, 5.2300, 5.2300, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:18', '2026-02-12 14:11:44', NULL, '[]'),
(786, 'DUMMY', 786, '0786', 786, NULL, NULL, 4.2000, 4.2000, 0.0000, 6.0000, 6.0000, '2026-02-02 09:40:18', '2026-02-03 09:00:06', NULL, '[]'),
(787, 'DUMMY', 787, '7896031232083', 787, NULL, NULL, 7.8900, 7.8900, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(788, 'DUMMY', 788, '7896117100367', 788, NULL, NULL, 5.9900, 5.9900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(789, 'DUMMY', 789, '7896117100350', 789, NULL, NULL, 5.9900, 5.9900, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(790, 'DUMMY', 790, '9771473968012', 790, NULL, NULL, 1.2500, 1.2500, 0.0000, 3.5000, 3.5000, '2026-02-02 09:40:18', '2026-02-13 16:57:30', NULL, '[]'),
(791, 'DUMMY', 791, '7896818500237', 791, NULL, NULL, 9.6900, 9.6900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(792, 'DUMMY', 792, '7897487300463', 792, NULL, NULL, 9.6900, 9.6900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(793, 'DUMMY', 793, '7897487300678', 793, NULL, NULL, 9.6900, 9.6900, 0.0000, 12.0000, 12.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(794, 'DUMMY', 794, '7893130865297', 794, NULL, NULL, 4.8400, 4.8400, 0.0000, 9.0000, 9.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(795, 'DUMMY', 795, '78939974', 795, NULL, NULL, 6.5000, 6.5000, 0.0000, 8.0000, 8.0000, '2026-02-02 09:40:18', '2026-02-02 09:40:18', NULL, '[]'),
(796, 'DUMMY', 796, '0796', 796, NULL, NULL, 2.7500, 2.7500, 0.0000, 10.0000, 10.0000, '2026-02-02 09:40:18', '2026-02-12 14:08:08', NULL, '[]'),
(797, 'DUMMY', 797, '7893487763932', 797, NULL, NULL, 0.6700, 0.6700, 0.0000, 1.5000, 1.5000, '2026-02-02 09:40:18', '2026-02-03 08:59:15', NULL, '[]'),
(798, 'DUMMY', 798, '7895310018950', 798, NULL, NULL, 0.3600, 0.3600, 0.0000, 0.8400, 0.8400, '2026-02-02 09:40:18', '2026-02-03 08:53:13', NULL, '[]'),
(0, 'DUMMY', 0, '1245', 0, NULL, NULL, 0.2300, 0.2300, 0.2300, 0.2300, 0.2300, '2026-02-17 02:36:01', '2026-02-17 02:42:21', NULL, '[]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `price_type` varchar(191) NOT NULL DEFAULT 'fixed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 99.0000, '2025-08-26 16:03:27', '2026-02-17 19:14:07'),
(2, 2, 2, 2, 1, 10.0000, '2025-08-26 16:48:43', '2026-02-17 20:41:04'),
(3, 3, 3, 3, 1, 499.0000, '2025-08-27 14:01:23', '2026-02-17 22:24:23'),
(1, 1, 1, 1, 1, 99.0000, '2025-08-26 20:03:27', '2026-02-17 19:14:07'),
(2, 2, 2, 2, 1, 10.0000, '2025-08-26 20:48:43', '2026-02-17 20:41:04'),
(3, 3, 3, 3, 1, 499.0000, '2025-08-27 18:01:23', '2026-02-17 22:24:23'),
(0, 0, 0, 0, 2, 197.0000, '2026-02-17 02:42:50', '2026-02-18 17:09:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `woocommerce_attr_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `woocommerce_sync_logs`
--

CREATE TABLE `woocommerce_sync_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `sync_type` varchar(191) NOT NULL,
  `operation_type` varchar(191) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indices de la tabla `account_detail_types`
--
ALTER TABLE `account_detail_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `account_subtypes`
--
ALTER TABLE `account_subtypes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Indices de la tabla `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indices de la tabla `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indices de la tabla `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_business_id_foreign` (`business_id`),
  ADD KEY `assets_category_id_foreign` (`category_id`),
  ADD KEY `assets_created_by_foreign` (`created_by`);

--
-- Indices de la tabla `asset_maintenances`
--
ALTER TABLE `asset_maintenances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_maintenances_business_id_index` (`business_id`),
  ADD KEY `asset_maintenances_asset_id_index` (`asset_id`),
  ADD KEY `asset_maintenances_status_index` (`status`),
  ADD KEY `asset_maintenances_priority_index` (`priority`),
  ADD KEY `asset_maintenances_created_by_index` (`created_by`),
  ADD KEY `asset_maintenances_assigned_to_index` (`assigned_to`);

--
-- Indices de la tabla `asset_transactions`
--
ALTER TABLE `asset_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_transactions_business_id_foreign` (`business_id`),
  ADD KEY `asset_transactions_asset_id_foreign` (`asset_id`),
  ADD KEY `asset_transactions_receiver_foreign` (`receiver`),
  ADD KEY `asset_transactions_parent_id_foreign` (`parent_id`),
  ADD KEY `asset_transactions_created_by_foreign` (`created_by`);

--
-- Indices de la tabla `asset_warranties`
--
ALTER TABLE `asset_warranties`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indices de la tabla `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indices de la tabla `branch_capital`
--
ALTER TABLE `branch_capital`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indices de la tabla `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indices de la tabla `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indices de la tabla `cash_denominations`
--
ALTER TABLE `cash_denominations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_denominations_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indices de la tabla `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indices de la tabla `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_woocommerce_cat_id_index` (`woocommerce_cat_id`);

--
-- Indices de la tabla `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indices de la tabla `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`),
  ADD KEY `contacts_crm_source_index` (`crm_source`),
  ADD KEY `contacts_crm_life_stage_index` (`crm_life_stage`),
  ADD KEY `contacts_converted_by_index` (`converted_by`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_call_logs`
--
ALTER TABLE `crm_call_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_call_logs_business_id_index` (`business_id`),
  ADD KEY `crm_call_logs_user_id_index` (`user_id`),
  ADD KEY `crm_call_logs_contact_id_index` (`contact_id`),
  ADD KEY `crm_call_logs_created_by_index` (`created_by`);

--
-- Indices de la tabla `crm_campaigns`
--
ALTER TABLE `crm_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_campaigns_business_id_foreign` (`business_id`),
  ADD KEY `crm_campaigns_created_by_index` (`created_by`);

--
-- Indices de la tabla `crm_contact_person_commissions`
--
ALTER TABLE `crm_contact_person_commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_lead_users`
--
ALTER TABLE `crm_lead_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_lead_users_user_id_index` (`user_id`),
  ADD KEY `crm_lead_users_contact_id_index` (`contact_id`);

--
-- Indices de la tabla `crm_marketplaces`
--
ALTER TABLE `crm_marketplaces`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crm_proposals`
--
ALTER TABLE `crm_proposals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_proposals_business_id_foreign` (`business_id`),
  ADD KEY `crm_proposals_contact_id_foreign` (`contact_id`),
  ADD KEY `crm_proposals_sent_by_index` (`sent_by`);

--
-- Indices de la tabla `crm_proposal_templates`
--
ALTER TABLE `crm_proposal_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_proposal_templates_business_id_foreign` (`business_id`),
  ADD KEY `crm_proposal_templates_created_by_index` (`created_by`);

--
-- Indices de la tabla `crm_schedules`
--
ALTER TABLE `crm_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_schedules_created_by_index` (`created_by`),
  ADD KEY `crm_schedules_business_id_index` (`business_id`),
  ADD KEY `crm_schedules_contact_id_index` (`contact_id`),
  ADD KEY `crm_schedules_schedule_type_index` (`schedule_type`),
  ADD KEY `crm_schedules_notify_type_index` (`notify_type`);

--
-- Indices de la tabla `crm_schedule_logs`
--
ALTER TABLE `crm_schedule_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_schedule_logs_schedule_id_foreign` (`schedule_id`),
  ADD KEY `crm_schedule_logs_created_by_index` (`created_by`);

--
-- Indices de la tabla `crm_schedule_users`
--
ALTER TABLE `crm_schedule_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crm_schedule_users_schedule_id_foreign` (`schedule_id`),
  ADD KEY `crm_schedule_users_user_id_index` (`user_id`);

--
-- Indices de la tabla `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indices de la tabla `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indices de la tabla `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`),
  ADD KEY `discounts_spg_index` (`spg`);

--
-- Indices de la tabla `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indices de la tabla `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indices de la tabla `essentials_allowances_and_deductions`
--
ALTER TABLE `essentials_allowances_and_deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_allowances_and_deductions_business_id_index` (`business_id`);

--
-- Indices de la tabla `essentials_attendances`
--
ALTER TABLE `essentials_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_attendances_user_id_index` (`user_id`),
  ADD KEY `essentials_attendances_business_id_index` (`business_id`),
  ADD KEY `essentials_attendances_essentials_shift_id_index` (`essentials_shift_id`);

--
-- Indices de la tabla `essentials_documents`
--
ALTER TABLE `essentials_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `essentials_document_shares`
--
ALTER TABLE `essentials_document_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_document_shares_document_id_index` (`document_id`),
  ADD KEY `essentials_document_shares_value_type_index` (`value_type`);

--
-- Indices de la tabla `essentials_holidays`
--
ALTER TABLE `essentials_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_holidays_business_id_index` (`business_id`),
  ADD KEY `essentials_holidays_location_id_index` (`location_id`);

--
-- Indices de la tabla `essentials_kb`
--
ALTER TABLE `essentials_kb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_kb_business_id_index` (`business_id`),
  ADD KEY `essentials_kb_parent_id_index` (`parent_id`),
  ADD KEY `essentials_kb_created_by_index` (`created_by`);

--
-- Indices de la tabla `essentials_kb_users`
--
ALTER TABLE `essentials_kb_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_kb_users_kb_id_index` (`kb_id`),
  ADD KEY `essentials_kb_users_user_id_index` (`user_id`);

--
-- Indices de la tabla `essentials_leaves`
--
ALTER TABLE `essentials_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_leaves_essentials_leave_type_id_index` (`essentials_leave_type_id`),
  ADD KEY `essentials_leaves_business_id_index` (`business_id`),
  ADD KEY `essentials_leaves_user_id_index` (`user_id`);

--
-- Indices de la tabla `essentials_leave_types`
--
ALTER TABLE `essentials_leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_leave_types_business_id_index` (`business_id`);

--
-- Indices de la tabla `essentials_messages`
--
ALTER TABLE `essentials_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_messages_business_id_index` (`business_id`),
  ADD KEY `essentials_messages_user_id_index` (`user_id`),
  ADD KEY `essentials_messages_location_id_index` (`location_id`);

--
-- Indices de la tabla `essentials_payroll_groups`
--
ALTER TABLE `essentials_payroll_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `essentials_payroll_group_transactions`
--
ALTER TABLE `essentials_payroll_group_transactions`
  ADD KEY `essentials_payroll_group_transactions_payroll_group_id_foreign` (`payroll_group_id`);

--
-- Indices de la tabla `essentials_reminders`
--
ALTER TABLE `essentials_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_reminders_business_id_index` (`business_id`),
  ADD KEY `essentials_reminders_user_id_index` (`user_id`);

--
-- Indices de la tabla `essentials_shifts`
--
ALTER TABLE `essentials_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_shifts_type_index` (`type`),
  ADD KEY `essentials_shifts_business_id_index` (`business_id`);

--
-- Indices de la tabla `essentials_todo_comments`
--
ALTER TABLE `essentials_todo_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_todo_comments_task_id_index` (`task_id`),
  ADD KEY `essentials_todo_comments_comment_by_index` (`comment_by`);

--
-- Indices de la tabla `essentials_to_dos`
--
ALTER TABLE `essentials_to_dos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_to_dos_status_index` (`status`),
  ADD KEY `essentials_to_dos_priority_index` (`priority`),
  ADD KEY `essentials_to_dos_created_by_index` (`created_by`),
  ADD KEY `essentials_to_dos_business_id_index` (`business_id`),
  ADD KEY `essentials_to_dos_task_id_index` (`task_id`);

--
-- Indices de la tabla `essentials_user_allowance_and_deductions`
--
ALTER TABLE `essentials_user_allowance_and_deductions`
  ADD KEY `essentials_user_allowance_and_deductions_user_id_index` (`user_id`),
  ADD KEY `allow_deduct_index` (`allowance_deduction_id`);

--
-- Indices de la tabla `essentials_user_sales_targets`
--
ALTER TABLE `essentials_user_sales_targets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `essentials_user_shifts`
--
ALTER TABLE `essentials_user_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_user_shifts_user_id_index` (`user_id`),
  ADD KEY `essentials_user_shifts_essentials_shift_id_index` (`essentials_shift_id`);

--
-- Indices de la tabla `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indices de la tabla `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indices de la tabla `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indices de la tabla `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`),
  ADD KEY `invoice_schemes_number_type_index` (`number_type`);

--
-- Indices de la tabla `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chart_of_account_id_index` (`chart_of_account_id`),
  ADD KEY `currency_id_index` (`currency_id`),
  ADD KEY `created_by_id_index` (`created_by_id`),
  ADD KEY `journal_entries_contact_id_index` (`contact_id`),
  ADD KEY `journal_entries_location_id_index` (`location_id`);

--
-- Indices de la tabla `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`),
  ADD KEY `media_woocommerce_media_id_index` (`woocommerce_media_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indices de la tabla `multi_currency_settings`
--
ALTER TABLE `multi_currency_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `multi_currency_settings_business_id_foreign` (`business_id`),
  ADD KEY `multi_currency_settings_business_currency_id_foreign` (`business_currency_id`),
  ADD KEY `multi_currency_settings_currency_id_foreign` (`currency_id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indices de la tabla `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pjt_invoice_lines`
--
ALTER TABLE `pjt_invoice_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pjt_invoice_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `pjt_invoice_lines_tax_rate_id_index` (`tax_rate_id`);

--
-- Indices de la tabla `pjt_projects`
--
ALTER TABLE `pjt_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pjt_projects_business_id_index` (`business_id`),
  ADD KEY `pjt_projects_contact_id_index` (`contact_id`),
  ADD KEY `pjt_projects_lead_id_index` (`lead_id`),
  ADD KEY `pjt_projects_created_by_index` (`created_by`);

--
-- Indices de la tabla `pjt_project_members`
--
ALTER TABLE `pjt_project_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pjt_project_members_project_id_foreign` (`project_id`),
  ADD KEY `pjt_project_members_user_id_index` (`user_id`);

--
-- Indices de la tabla `pjt_project_tasks`
--
ALTER TABLE `pjt_project_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pjt_project_tasks_project_id_foreign` (`project_id`),
  ADD KEY `pjt_project_tasks_business_id_index` (`business_id`),
  ADD KEY `pjt_project_tasks_created_by_index` (`created_by`);

--
-- Indices de la tabla `pjt_project_task_comments`
--
ALTER TABLE `pjt_project_task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pjt_project_task_comments_project_task_id_foreign` (`project_task_id`);

--
-- Indices de la tabla `pjt_project_task_members`
--
ALTER TABLE `pjt_project_task_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pjt_project_task_members_project_task_id_foreign` (`project_task_id`),
  ADD KEY `pjt_project_task_members_user_id_index` (`user_id`);

--
-- Indices de la tabla `pjt_project_time_logs`
--
ALTER TABLE `pjt_project_time_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pjt_project_time_logs_project_id_foreign` (`project_id`),
  ADD KEY `pjt_project_time_logs_project_task_id_foreign` (`project_task_id`),
  ADD KEY `pjt_project_time_logs_user_id_index` (`user_id`),
  ADD KEY `pjt_project_time_logs_created_by_index` (`created_by`);

--
-- Indices de la tabla `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`),
  ADD KEY `products_secondary_unit_id_index` (`secondary_unit_id`),
  ADD KEY `products_woocommerce_product_id_index` (`woocommerce_product_id`),
  ADD KEY `products_woocommerce_media_id_index` (`woocommerce_media_id`);

--
-- Indices de la tabla `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
