# Decentralized Performance Measurement KPI Optimization

A comprehensive blockchain-based system for managing Key Performance Indicators (KPIs) using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a decentralized approach to performance measurement and KPI optimization through five interconnected smart contracts:

- **KPI Manager Verification**: Validates and manages authorized KPI managers
- **Metric Definition**: Defines and manages performance metrics
- **Target Setting**: Sets and manages performance targets
- **Progress Tracking**: Records and tracks actual performance against targets
- **Optimization Recommendation**: Provides intelligent recommendations for KPI improvements

## Architecture

### Smart Contracts

#### 1. KPI Manager Verification (`kpi-manager-verification.clar`)
- Manages authorized personnel who can create and manage KPIs
- Stores manager details including name, department, and verification timestamp
- Provides role-based access control for the entire system

#### 2. Metric Definition (`metric-definition.clar`)
- Defines performance metrics with detailed metadata
- Supports various metric types and units of measurement
- Allows activation/deactivation of metrics

#### 3. Target Setting (`target-setting.clar`)
- Sets performance targets for defined metrics
- Manages target periods and values
- Supports target updates and modifications

#### 4. Progress Tracking (`progress-tracking.clar`)
- Records actual performance values against targets
- Calculates achievement rates automatically
- Maintains historical progress records

#### 5. Optimization Recommendation (`optimization-recommendation.clar`)
- Generates performance-based recommendations
- Prioritizes recommendations by importance
- Tracks recommendation status and implementation

## Features

### Core Functionality
- ✅ Decentralized KPI management
- ✅ Role-based access control
- ✅ Automated performance calculations
- ✅ Historical data tracking
- ✅ Intelligent recommendations
- ✅ Multi-period target management

### Security Features
- ✅ Manager verification system
- ✅ Access control on all operations
- ✅ Data integrity validation
- ✅ Immutable audit trail

## Getting Started

### Prerequisites
- Stacks blockchain node
- Clarity development environment
- Clarinet CLI tool

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd kpi-optimization
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   clarinet install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

1. Deploy contracts in order:
   \`\`\`bash
   clarinet deploy --testnet
   \`\`\`

2. Verify deployment:
   \`\`\`bash
   clarinet console
   \`\`\`

## Usage Examples

### 1. Verify a KPI Manager
\`\`\`clarity
(contract-call? .kpi-manager-verification verify-manager
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX975CN0QKK6
"John Doe"
"Sales")
\`\`\`

### 2. Create a Performance Metric
\`\`\`clarity
(contract-call? .metric-definition create-metric
"Monthly Sales Revenue"
"Total revenue generated per month"
"financial"
"USD")
\`\`\`

### 3. Set a Performance Target
\`\`\`clarity
(contract-call? .target-setting set-target
u1
u100000
u1000
u2000)
\`\`\`

### 4. Record Progress
\`\`\`clarity
(contract-call? .progress-tracking record-progress
u1
u95000
"Q1 performance slightly below target")
\`\`\`

### 5. Create Optimization Recommendation
\`\`\`clarity
(contract-call? .optimization-recommendation create-recommendation
u1
"process-improvement"
"Implement lead scoring system to improve conversion rates"
u2)
\`\`\`

## API Reference

### KPI Manager Verification
- \`verify-manager(manager, name, department)\` - Verify a new KPI manager
- \`revoke-manager(manager)\` - Revoke manager access
- \`is-verified-manager(manager)\` - Check if manager is verified
- \`get-manager-details(manager)\` - Get manager information

### Metric Definition
- \`create-metric(name, description, type, unit)\` - Create new metric
- \`deactivate-metric(metric-id)\` - Deactivate metric
- \`get-metric(metric-id)\` - Get metric details

### Target Setting
- \`set-target(metric-id, value, start, end)\` - Set performance target
- \`update-target(target-id, new-value)\` - Update target value
- \`get-target(target-id)\` - Get target details

### Progress Tracking
- \`record-progress(target-id, actual-value, notes)\` - Record performance
- \`update-progress(progress-id, new-value)\` - Update progress record
- \`calculate-achievement-rate(target-id, actual-value)\` - Calculate achievement percentage

### Optimization Recommendation
- \`create-recommendation(target-id, type, description, priority)\` - Create recommendation
- \`update-recommendation-status(recommendation-id, status)\` - Update recommendation status
- \`analyze-performance(target-id, actual-value)\` - Analyze performance status

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Test coverage includes:
- Contract deployment
- Manager verification
- Metric creation and management
- Target setting and updates
- Progress tracking
- Recommendation generation

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation wiki

## Roadmap

- [ ] Advanced analytics dashboard
- [ ] Multi-chain deployment
- [ ] Integration with external data sources
- [ ] Mobile application interface
- [ ] Advanced recommendation algorithms
  \`\`\`

Now let's create the PR details file:
